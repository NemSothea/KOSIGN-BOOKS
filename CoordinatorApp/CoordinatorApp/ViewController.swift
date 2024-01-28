//
//  ViewController.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/08.
//

import UIKit

class ViewController: UIViewController, StoryBoarded {

    @IBOutlet weak var  playButton      : UIButton!
    @IBOutlet weak var  tileLabel       : UILabel!
    @IBOutlet weak var  subTitleLabel   : UILabel!
    
    @IBOutlet weak var waveView         : WaveView!
    
    
    var gotoMain : ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        self.tileLabel.textColor        = UIColor.random()
        self.subTitleLabel.textColor    = UIColor.random()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.waveView.animationStart(direction: .right, speed: 10)
        }
        
    }
    
    
    @IBAction func clickTap(_ sender : UIButton) {
        
        sender.showAnimation { [weak self] in
            self?.gotoMain?(true)
        }

    }


}
