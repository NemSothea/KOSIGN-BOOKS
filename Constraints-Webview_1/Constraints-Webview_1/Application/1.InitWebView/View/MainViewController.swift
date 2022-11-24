//
//  MainViewController.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myTableView : UITableView!
    
    let contentVM = ContentVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentVM.loadContent()
        // Do any additional setup after loading the view.
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
extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentVM.recordContent?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let contentTitle = contentVM.recordContent?[indexPath.row]
        cell.decriptionLabel.text = contentTitle?.title ?? ""
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        guard let webKitType = self.contentVM.recordContent?[indexPath.row].type else
        {
            return
        }
        switch webKitType {
        case .LoadURL :
            break
        default :
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
