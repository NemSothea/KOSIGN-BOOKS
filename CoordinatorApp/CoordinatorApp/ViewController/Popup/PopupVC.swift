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

    var detail0                          = ""
    var detail1                          = ""
    
    let fontSize = Share.shared.setFontSize()
    
    //MARK: ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        let titleLabel = UILabel(frame: CGRect(x: 10,y: 10, width: 100 ,height:50))
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        titleLabel.text  = "내용\n"
        headerView.addSubview(titleLabel)
       
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        footerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        let checkButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width/2) - 80,y: 0, width: 200,height:50))
        
        let attritNextText = NSAttributedString(string: "화인", attributes: [NSAttributedString.Key.font: UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!])
        checkButton.setAttributedTitle(attritNextText, for: .normal)
        checkButton.tintColor           = UIColor.white
        checkButton.setTitleColor(UIColor.white, for: .normal)
        checkButton.backgroundColor     = UIColor.systemBlue
        checkButton.layer.cornerRadius  = 8
        checkButton.layer.shadowColor   = UIColor.green.cgColor
        checkButton.layer.shadowOpacity = 0.8
        checkButton.layer.shadowOffset  = CGSize(width: 1, height: 1)
        checkButton.layer.borderWidth   = 1
        checkButton.layer.borderColor   = UIColor.green.cgColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        footerView.addGestureRecognizer(tap)
        checkButton.addGestureRecognizer(tap)
        footerView.addSubview(checkButton)
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PopupCell else { return PopupCell()
        }
        cell.infoLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        cell.infoLabel.text = "\n\(detail0)\n\n\(detail1)"

        return cell
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
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
