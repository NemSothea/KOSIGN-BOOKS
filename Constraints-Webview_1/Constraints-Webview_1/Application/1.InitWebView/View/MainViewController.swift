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
    /**
            FUNCTION LoadURL with Param
     */
    private func loadURLWithParam() {
        let vc = UIStoryboard(name: "WebKitSB", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewController") as! WebKitViewController
        let url = "https://biztrip-dev.appplay.co.kr/biztrip_mpoint_gate.act"
        let jsonString = Share.callBizPoint().encodeToJsonString
        vc.urlString = "\(url)?JSONData=\(jsonString)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /**
            FUNCTION  WKNavigationDelegate, Cookies
     */
    private func webKitViewAction() {
        
        let vc = UIStoryboard(name: "WebKitSB", bundle: nil).instantiateViewController(withIdentifier: "WebKitViewController") as! WebKitViewController
        let  domainUrl  = "https://approval-dev.appplay.co.kr//MApprGateway/APPROVAL_DTL_101.act"
        let param       = "APPR_SEQ_NO=856721&POPUP_YN=N"
        vc.urlString    = domainUrl
        vc.param        = param
        vc.webKitType   = .Cookie_WebView
        self.navigationController?.pushViewController(vc, animated: true)
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
        vc.webKitType = webKitType
        switch webKitType {
        case .LoadURL :
            self.loadURLWithParam()
        case .WKNavigationDelegate,.Cookies :
            self.webKitViewAction()
        default :
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
