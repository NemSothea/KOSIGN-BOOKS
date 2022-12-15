//
//  ViewController.swift
//  AutoLayoutiOS
//
//  Created by Bizplay on 2022/12/12.
//

import UIKit

class ViewController: UIViewController {
    /*
      TODO :- @Outlet
     */
    @IBOutlet weak var bottomView                   : UIView!
    @IBOutlet weak var stackView                    : UIView!
    @IBOutlet weak var heightStackView              : NSLayoutConstraint!
    @IBOutlet weak var heightBottomViewConstraint   : NSLayoutConstraint!
    
    /*
      TODO :- @Variable
     */
    var descriptionLabel = UILabel()
    
    /*
            TODO :- @Viewcontroller life cycle
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bottomView.layer.cornerRadius = 16
        self.bottomView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        self.hideBottomView()
        
        self.bottomView.addSubview(self.descriptionLabel)
        
        let margins = self.bottomView.layoutMarginsGuide
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 10).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        self.descriptionLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5).isActive = true
        
        self.descriptionLabel.text = " Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger ."
        self.descriptionLabel.textAlignment = .justified
        self.descriptionLabel.numberOfLines = 0
        
    }
    
    /*
      TODO :-  @IBACTION
     */
    @IBAction func showTapClick(_ sender : Any) {
        UIView.animate(withDuration: 0.5) {
            self.showBottomView()
            self.view.layoutIfNeeded()
        }
     
    }
    @IBAction func dimissTapViewClick(_ sender : Any) {
        UIView.animate(withDuration: 0.5) {
            self.hideBottomView()
            self.view.layoutIfNeeded()
        }
     
    }
    
    /*
        TODO :- FUNCTION
     */
    private func showBottomView() {
        self.heightBottomViewConstraint.constant    = 140.0
        self.heightStackView.constant               = 40.0
        self.descriptionLabel.alpha                 = 1.0
        self.stackView.alpha                        = 1.0
    }
    
    private func hideBottomView() {
        self.heightBottomViewConstraint.constant    = 0.0
        self.heightStackView.constant               = 0.0
        self.descriptionLabel.alpha                 = 0.0
        self.stackView.alpha                        = 0.0
    }
    


}

