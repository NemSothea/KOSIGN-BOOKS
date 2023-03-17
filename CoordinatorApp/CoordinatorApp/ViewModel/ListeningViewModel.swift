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
            "TOPIK II Listening 24th",
            "TOPIK II Listening 25th",
            "TOPIK II Listening 26th",
            "TOPIK II Listening 27th",
            "TOPIK II Listening 28th",
            "TOPIK II Listening 29th",
            "TOPIK II Listening 30th",
            "TOPIK II Listening 31th",
            "TOPIK II Listening 32th",
            "TOPIK II Listening 33th",
            "TOPIK II Listening 34th",
            "TOPIK II Listening 35th",
            "TOPIK II Listening 36th",
            "TOPIK II Listening 37th",
            "TOPIK II Listening 41th",
            "TOPIK II Listening 47th",
            "TOPIK II Listening 52th",
            "TOPIK II Listening 60th",
            "TOPIK II Listening 64th"
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
        case 18 :
            i = "64"
        default :
            break
        }
        
        self.data =  Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from:"Listening\(i).json")
        self.setupAudio(index: i)
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
