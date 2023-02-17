//
//  ListeningViewModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/17.
//

import AVFoundation

class ListeningViewModel {
    var player : AVAudioPlayer?
    
    func playMP3File(index : Int) {
        
        var i = "listening24"
        switch index {
        case 0:
            i = "listening24"
        default :
            break
        }
        let url = Bundle.main.url(forResource: "\(i)", withExtension: "mp3")
        do {
            player = try! AVAudioPlayer(contentsOf: url!)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
            
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
}
