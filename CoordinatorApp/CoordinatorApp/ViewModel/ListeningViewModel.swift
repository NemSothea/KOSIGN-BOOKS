//
//  ListeningViewModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/17.
//

import AVFoundation

class ListeningViewModel {
    
    var player : AVAudioPlayer?
    var data    : ReadingQuestionModel.QuestionModel?
    
    var TOPIKQuestionArray  = [String]()
    
    func initListeningData() {
        TOPIKQuestionArray = [
            "TOPIK II Listenging 24th",
            "TOPIK II Listenging 25th",
            "TOPIK II Listenging 26th",
            "TOPIK II Listenging 27th",
            "TOPIK II Listenging 28th",
            "TOPIK II Listenging 29th",
            "TOPIK II Listenging 30th",
            "TOPIK II Listenging 31th",
            "TOPIK II Listenging 32th",
            "TOPIK II Listenging 33th",
            "TOPIK II Listenging 34th",
            "TOPIK II Listenging 35th",
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
        default :
            break
        }
        
        self.data =  Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from:"Listening\(i).json")
        
    }
    
    func playMP3File(index : Int) {
        
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
        default :
            break
        }
        let url = Bundle.main.url(forResource: "Listening\(i)", withExtension: "mp3")
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
