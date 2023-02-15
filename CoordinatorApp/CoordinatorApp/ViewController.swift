//
//  ViewController.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/08.
//

import UIKit

class ViewController: UIViewController, StoryBoarded {

    var gotoMain : ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func clickTap(_ sender : UIButton) {
        gotoMain?(true)
    }


}

