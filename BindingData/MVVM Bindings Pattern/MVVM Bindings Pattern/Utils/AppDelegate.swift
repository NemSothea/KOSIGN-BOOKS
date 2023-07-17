//
//  AppDelegate.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/05/31.
//

import UIKit


//MARK: - Simple Push notification by : APNS
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var countBage : Int = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /* TODO:
         - Background Mode
         */
        
        UNUserNotificationCenter.current().delegate = self
        /*
         - Just example if push have count bage : 1, 2, 3
         */
        countBage = UIApplication.shared.applicationIconBadgeNumber
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let myDeviceToken = deviceToken.reduce("", {$0 + String(format: "%02X",$1)})
        print("Device Token: \(myDeviceToken)")
    }/**
      MARK -:
      - If the app is in the background, and "content-available" == true
      
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
      
    }
      */
    /**
     MARK -:
     -  If the app is in the background, nothing is called until the user taps the notification, at that point, the app will open and call this.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // TODO -:
        /* Method : 1 -> Push the PostViewController onto the navigation stack by NotificationCenter
         
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewPost"), object: response.notification.request.content.userInfo)
         */
        
        // Method : 2
        guard let aps   = response.notification.request.content.userInfo["aps"] as? [String : Any] else { return }
        guard let isNewPost  = aps["post"] as? String else { return }
        
        // If isNewPost data come and true
        //Push the PostViewController onto the navigation stack
        if isNewPost == "true" {
            self.pushToPostViewController()
        }
        completionHandler()
       
    }
    private func pushToPostViewController() {
        // Get the current window scene
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        
        if let window = windowScene?.windows.first, let rootViewController = window.rootViewController as? UINavigationController {
            // Instantiate the PostViewController from the PostSB storyboard
            let postSB = UIStoryboard.init(name: "PostSB", bundle: nil)
            let postVC = postSB.instantiateViewController(withIdentifier: "postViewControllerID") as! PostViewController
            // Push the PostViewController onto the navigation stack
            rootViewController.pushViewController(postVC, animated: true)
        }
    }

}

//MARK: - UNUserNotificationCenterDelegate
extension AppDelegate : UNUserNotificationCenterDelegate {
    public func registerForRemoteNotification() {
        
        // For display notification (send via APNS)
        // Set the current object as the delegate for the user notification center
        UNUserNotificationCenter.current().delegate = self
        
        // Define the authorization options for receiving notifications
        let authOptions : UNAuthorizationOptions = [.alert,.badge,.sound]
        
        // Request user authorization for displaying notifications
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (granted, error) in
            switch error {
            case .none :
                // If authorization is granted, register for remote notifications on the main queue
                if granted {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            case .some(let error) :
                // Retry the registration in case of error and print the error description
                self.registerForRemoteNotification()
                print(error.localizedDescription)
            }
        }
        
    }
    // This method is called when a notification is received and the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Configure the presentation options for the notification
        completionHandler([.list,.banner,.badge,.sound])
        
    }
    // This method is called when the app fails to register for remote notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}


