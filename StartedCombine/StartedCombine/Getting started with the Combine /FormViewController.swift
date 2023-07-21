//
//  FormViewController.swift
//  StartedCombine
//
//  Created by Bizplay on 2023/07/20.
//

import UIKit
import Combine



class FormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     -> Link : https://www.avanderlee.com/swift/combine/
    */

}

extension Notification.Name {
    static let newBlogPost = Notification.Name("new_blog_post")
}
/**
 1. The basic principles of Combine
 
 Publishers and subscribers
 The Combine framework comes with so-called Publishers and subscribers. If you’re familiar with RxSwift:

    Publishers are the same as Observables
    Subscribers are the same as Observers
 
 2. The Foundation framework and Combine
    A URLSessionTask Publisher that publishes the data response or request error
    Operators for easy JSON decoding
    A Publisher for a specific Notification.Name that publishes the notification
 */
