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
    
    private let player64            = AVQueuePlayer()
    
    var data                        : ReadingQuestionModel.QuestionModel?
    
    var TOPIKQuestionArray          = [String]()
    
    private var currentFrame: AVAudioFramePosition {
      guard
        let lastRenderTime = player.lastRenderTime,
        let playerTime = player.playerTime(forNodeTime: lastRenderTime)
      else {
        return 0
      }

      return playerTime.sampleTime
    }
    
    func initListeningData() {
        TOPIKQuestionArray = [
            "듣기 24th",
            "듣기 25th",
            "듣기 26th",
            "듣기 27th",
            "듣기 28th",
            "듣기 29th",
            "듣기 30th",
            "듣기 31th",
            "듣기 32th",
            "듣기 33th",
            "듣기 34th",
            "듣기 35th",
            "듣기 36th",
            "듣기 37th",
            "듣기 41th",
            "듣기 47th",
            "듣기 52th",
            "듣기 60th",
            "듣기 64th"
        ]
    }
    func getData(index : Int) {
        
        var i = "24"
        switch index {
        case 1 :
            i = "25"
        case 2 :
            i = "26"
        case 3 :
            i = "27"
        case 4 :
            i = "28"
        case 5 :
            i = "29"
        case 6 :
            i = "30"
        case 7 :
            i = "31"
        case 8 :
            i = "32"
        case 9 :
            i = "33"
        case 10 :
            i = "34"
        case 11 :
            i = "35"
        case 12 :
            i = "36"
        case 13 :
            i = "37"
        case 14 :
            i = "41"
        case 15 :
            i = "47"
        case 16 :
            i = "52"
        case 17 :
            i = "60"
        default :
            break
        }
        
        self.data =  Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from:"Listening\(i).json")
        if i == "18" {
            self.original64Play(index: i)
        }else {
            self.setupAudio(index: i)
        }
       
    }
    private func setupAudio(index : String) {

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
    private func original64Play(index : String) {
        if let url = Bundle.main.url(forResource: "Listening\(index)th", withExtension: "m4a") {
            player64.removeAllItems()
            player64.insert(AVPlayerItem(url: url),after:nil)
            player64.play()
        }
    }
    func stopPlay() {
        self.player.pause()
        self.player.stop()
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
