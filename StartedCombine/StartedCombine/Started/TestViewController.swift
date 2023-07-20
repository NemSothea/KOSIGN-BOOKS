//
//  TestViewController.swift
//  StartedCombine
//
//  Created by Bizplay on 2023/07/20.
//

import UIKit
import Combine

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /// 1. Create a publisher that listens for notifications named .newBlogPost from the default notification center.
        ///    The publisher maps the notification object (a BlogPost object) to its title (String?) using the map operator.
        
        let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost,object: nil)
            .map { (notification) -> String? in
                return (notification.object as? BlogPost)?.title ?? ""
            }
        /// 2. Create a UILabel that will display the title of the last blog post.
        let lastPostLabel = UILabel()
        
        /// 3. Create a subscriber that assigns the value emitted by the blogPostPublisher to the text property of lastPostLabel.
        let lastPostLabelSubcriber = Subscribers.Assign(object: lastPostLabel, keyPath: \.text)
        
        /// 4. Subscribe the lastPostLabelSubscriber to the blogPostPublisher.
        ///    This means that whenever a new blog post notification is received,
        ///    the title of the last blog post will be updated in the lastPostLabel.
        blogPostPublisher.subscribe(lastPostLabelSubcriber)
        
        //Testing blogPost
        
        let blogPost = BlogPost(title: "This is test new Combine", url: URL(string: "https://www.google.com")!)
        NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
        
        print("Result BlogPost:\(lastPostLabel.text!)")
        
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

struct BlogPost {
    let title   : String
    let url     : URL
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
