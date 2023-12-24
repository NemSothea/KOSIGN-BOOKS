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
    @IBOutlet weak var mainView         : UIView!
    @IBOutlet weak var contentLabel     : UILabel!
    @IBOutlet weak var checkButton      : UIButton!
    
    var detail0                          = ""
    var detail1                          = ""
    
    let fontSize = Share.shared.setFontSize()
    
    //MARK: ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        self.contentLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.checkButton.titleLabel?.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        self.mainView.clipsToBounds = true
        self.mainView.layer.cornerRadius = 10
        self.mainView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMinYCorner]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PopupCell else { return PopupCell()}
        cell.infoLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        cell.infoLabel.text = "\(detail0)\n\(detail1)"

        return cell
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
