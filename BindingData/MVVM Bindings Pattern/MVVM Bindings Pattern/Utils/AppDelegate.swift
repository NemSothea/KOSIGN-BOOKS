//
//  AppDelegate.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/05/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var countBage : Int = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /* TODO:
         - Background Mode
         */
        
        UNUserNotificationCenter.current().delegate = self
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
      */
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {


    }
    /**
     MARK -:
     -  If the app is in the background, nothing is called until the user taps the notification, at that point, the app will open and call this.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        guard let aps   = response.notification.request.content.userInfo["aps"] as? [String : Any] else { return }
        guard let isNewPost  = aps["post"] as? String else { return }
        if isNewPost == "true" {
            print("Go to PostVc")
        }
    }

}

//Mark : UNUserNotificationCenterDelegate
extension AppDelegate : UNUserNotificationCenterDelegate {
    public func registerForRemoteNotification() {
        
        // For display notification (send via APNS)
        UNUserNotificationCenter.current().delegate = self
        let authOptions : UNAuthorizationOptions = [.alert,.badge,.sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (granted, error) in
            switch error {
            case .none :
                if granted {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            case .some(let error) :
                self.registerForRemoteNotification()
                print(error.localizedDescription)
            }
        }
        
    }
    /**
     MARK-:
    - If the app is in the foreground, the app will call this.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.list,.banner,.badge,.sound])
        
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}

