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
    
    var gotoMain : ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.playButton.tintColor       = UIColor.random()
        self.playButton.backgroundColor = UIColor.random()
        self.tileLabel.textColor        = UIColor.random()
        self.subTitleLabel.textColor    = UIColor.random()
    }
    
    
    @IBAction func clickTap(_ sender : UIButton) {
        
        sender.showAnimation {
            self.gotoMain?(true)
        }

    }


}

