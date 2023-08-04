//
//  ListeningViewModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/17.
//

import AVFoundation
import Foundation
import SwiftUI

class ListeningViewModel : NSObject, ObservableObject {
    
    var isPlaying = false {
      willSet {
        withAnimation {
          objectWillChange.send()
        }
      }
    }
    var isPlayerReady = false {
      willSet {
        objectWillChange.send()
      }
    }
    var meterLevel: Float = 0 {
      willSet {
        objectWillChange.send()
      }
    }
    
    // MARK: Private properties

    private let engine              = AVAudioEngine()
    private let player              = AVAudioPlayerNode()
    private let timeEffect          = AVAudioUnitTimePitch()

    private var displayLink         : CADisplayLink?

    private var needsFileScheduled  = true

    private var audioFile           : AVAudioFile?
    private var audioSampleRate     : Double = 0
    private var audioLengthSeconds  : Double = 0

    private var seekFrame           : AVAudioFramePosition = 0
    private var currentPosition     : AVAudioFramePosition = 0
    private var audioLengthSamples  : AVAudioFramePosition = 0
    
    let player64                    = AVQueuePlayer()
    
    var data                        : ReadingQuestionModel.QuestionModel?
    
    var TOPIKQuestionArray : [QuestionType] = []
    
    func initListeningData() {
        TOPIKQuestionArray = QuestionType.allCases
    }
    
    private var currentFrame: AVAudioFramePosition {
      guard
        let lastRenderTime = player.lastRenderTime,
        let playerTime = player.playerTime(forNodeTime: lastRenderTime)
      else {
        return 0
      }

      return playerTime.sampleTime
    }
    
    func getData(for questionNumber: Int) {

        guard let question = QuestionType(rawValue: questionNumber) else {
            print("Invalid question number")
            return
        }
        
        let fileName = "Listening\(question.rawValue)"
        self.data =  Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from:"\(fileName).json")
        self.setupAudio(index: question.rawValue)
    }
    
    private func setupAudio(index : Int) {

        guard let fileURL = Bundle.main.url(forResource: "Listening\(index)th", withExtension: "mp3") else {
          return
        }
        do {
            let file = try AVAudioFile(forReading: fileURL)
            
            let format = file.processingFormat
            audioLengthSamples = file.length
            audioSampleRate = format.sampleRate
            audioLengthSeconds = Double(audioLengthSamples) / audioSampleRate
            
            audioFile = file
            configureEngine(with: format)
        } catch {
            print("Error reading the audio file: \(error.localizedDescription)")
        }
    }
    func original64Play(index : String) {
        if let url = Bundle.main.url(forResource: "Listening\(index)th", withExtension: "m4a") {
            player64.removeAllItems()
            player64.insert(AVPlayerItem(url: url),after:nil)
            player64.play()
        }
    }
    func stopPlay(index : String) {
        if index == "64" {
            self.player64.pause()
            self.player64.removeAllItems()
        }else {
            self.player.pause()
            self.player.stop()
        }
        
    }
    func stopAllCurrentPlay() {
        self.player.stop()
        self.player64.pause()
        self.player64.removeAllItems()
    }
    func playOrPause() {
        self.isPlaying.toggle()
        if self.player.isPlaying {
            self.displayLink?.isPaused = true
            self.disconnectVolumeTap()

            self.player.pause()
        } else {
            self.displayLink?.isPaused = false
            self.connectVolumeTap()

            if self.needsFileScheduled {
              self.scheduleAudioFile()
          }
            self.player.play()
        }
    }
    
    private func configureEngine(with format: AVAudioFormat) {
      engine.attach(player)
      engine.attach(timeEffect)

      engine.connect(
        player,
        to: timeEffect,
        format: format)
      engine.connect(
        timeEffect,
        to: engine.mainMixerNode,
        format: format)

      engine.prepare()

      do {
        try engine.start()

        scheduleAudioFile()
        isPlayerReady = true
      } catch {
        print("Error starting the player: \(error.localizedDescription)")
      }
    }
    private func disconnectVolumeTap() {
      engine.mainMixerNode.removeTap(onBus: 0)
      meterLevel = 0
    }
    private func connectVolumeTap() {
      let format = engine.mainMixerNode.outputFormat(forBus: 0)

      engine.mainMixerNode.installTap(
        onBus: 0,
        bufferSize: 1024,
        format: format
      ) { buffer, _ in
        guard let channelData = buffer.floatChannelData else {
          return
        }

        let channelDataValue = channelData.pointee
        let channelDataValueArray = stride(
          from: 0,
          to: Int(buffer.frameLength),
          by: buffer.stride)
          .map { channelDataValue[$0] }

        let rms = sqrt(channelDataValueArray.map {
          return $0 * $0
        }
        .reduce(0, +) / Float(buffer.frameLength))

        let avgPower = 20 * log10(rms)
        let meterLevel = self.scaledPower(power: avgPower)

        DispatchQueue.main.async {
          self.meterLevel = self.isPlaying ? meterLevel : 0
        }
      }
    }
    // MARK: Audio metering

    private func scaledPower(power: Float) -> Float {
      guard power.isFinite else {
        return 0.0
      }

      let minDb: Float = -80

      if power < minDb {
        return 0.0
      } else if power >= 1.0 {
        return 1.0
      } else {
        return (abs(minDb) - abs(power)) / abs(minDb)
      }
    }
    private func scheduleAudioFile() {
      guard
        let file = audioFile,
        needsFileScheduled
      else {
        return
      }

      needsFileScheduled = false
      seekFrame = 0

      player.scheduleFile(file, at: nil) {
        self.needsFileScheduled = true
      }
    }
}
