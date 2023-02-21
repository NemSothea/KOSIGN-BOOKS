//
//  PopupVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/21.
//

import UIKit

class PopupVC : UIViewController {

    @IBOutlet weak var contentLabel     : UILabel!
    var detail                          = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentLabel.text = detail
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
