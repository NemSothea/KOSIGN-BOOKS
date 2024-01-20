//
//  ViewController.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/08.
//

import UIKit

class ViewController: UIViewController, StoryBoarded {

    @IBOutlet weak var  playButton : UIButton!
    
    var gotoMain : ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0

        self.playButton.layer.add(pulse, forKey: "pulseAnimation")
    }
    
    @IBAction func clickTap(_ sender : UIButton) {
        
        self.pulsate()
        
        DispatchQueue.main.async {
            self.gotoMain?(true)
        }
        
    }


}

