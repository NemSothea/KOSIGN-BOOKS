//
//  PopupVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/21.
//

import UIKit

class PopupVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView        : UITableView!
    @IBOutlet weak var mainView         : UIView!
    
    var detail0                          = ""
    var detail1                          = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.clipsToBounds = true
        self.mainView.layer.cornerRadius = 10
        self.mainView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMinYCorner]
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PopupCell else { return PopupCell()}
        
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
