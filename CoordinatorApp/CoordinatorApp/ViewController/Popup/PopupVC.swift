//
//  PopupVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/21.
//

import UIKit

class PopupVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView        : UITableView!

    @IBOutlet weak var contentButton    : UIButton!
    @IBOutlet weak var doneButton       : UIButton!
    
    var detail0                          = ""
    var detail1                          = ""
    
    let fontSize = Share.shared.setFontSize()
    
    //MARK: ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributedContentText = NSAttributedString(string: "내용", attributes: [NSAttributedString.Key.font: UIFont(name: "1HoonDdukbokki Regular", size: fontSize) ?? 0])
        self.contentButton.setAttributedTitle(attributedContentText, for: .normal)
        
        let attributedDoneText = NSAttributedString(string: "확인", attributes: [NSAttributedString.Key.font: UIFont(name: "1HoonDdukbokki Regular", size: fontSize) ?? 0])
        self.doneButton.setAttributedTitle(attributedDoneText, for: .normal)
        
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        sender.showAnimation {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PopupCell else { return PopupCell()
        }
        
        cell.infoLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        let attributedString = NSMutableAttributedString(string: "\(detail0)\(detail1)")

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        let isPad = UIDevice.current.userInterfaceIdiom == .pad
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing =  3 // Whatever line spacing you want in points
        paragraphStyle.lineHeightMultiple = isPad ? 2 : 1.5
        

        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        // *** Set Attributed String to your label ***

        cell.infoLabel.attributedText         = attributedString

        return cell
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.dismiss(animated: true)
    }

}
