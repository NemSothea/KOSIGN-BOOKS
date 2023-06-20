//
//  AppDelegate.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/05/31.
//

import UIKit

import Firebase
import FirebaseMessaging
import FirebaseAnalytics

//MARK: - Simple push notification by : FCM
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let gcmMessageIDKey = "gcm.Message_ID"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        /*
         1. It configures your app to work with Firebase.
         2. It sets how much Firebase will log. Setting this to min reduces the amount of data you’ll see in your debugger.
         */
        //1
        FirebaseApp.configure()
        //2
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        
        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )

        application.registerForRemoteNotifications()

        Messaging.messaging().delegate = self
        
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
        Messaging.messaging().apnsToken = deviceToken
    }

}

//MARK: - MessagingDelegate
extension AppDelegate : MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")
      
      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}

//MARK: - UNUserNotificationCenterDelegate
extension AppDelegate : UNUserNotificationCenterDelegate {
    /**
    - If the app is in the foreground, the app will call this.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = notification.request.content.userInfo

        Messaging.messaging().appDidReceiveMessage(userInfo)
        completionHandler([.list,.banner,.badge,.sound])
        
    }
    
    /**
     MARK -:
     -  If the app is in the background, nothing is called until the user taps the notification, at that point, the app will open and call this.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
      let userInfo = response.notification.request.content.userInfo

        // Print full message.
           print(userInfo)

      completionHandler()
    }
    /**
      MARK -:
      - If the app is in the background, and "content-available" == true
      
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
      
    }
      */
    func application(_ application: UIApplication,
                       didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                       fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult)
                         -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification

        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)

        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
          print("Message ID: \(messageID)")
        }

        // Print full message.
        print(userInfo)

        completionHandler(UIBackgroundFetchResult.newData)
      }
  
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}


//MARK: - Simple Push notification by : APNS
/*
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
      
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
      
    }
      */
    /**
     MARK -:
     -  If the app is in the background, nothing is called until the user taps the notification, at that point, the app will open and call this.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // TODO -:
        /* Method : 1
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewPost"), object: response.notification.request.content.userInfo)
         */
        
        // Method : 2
        guard let aps   = response.notification.request.content.userInfo["aps"] as? [String : Any] else { return }
        guard let isNewPost  = aps["post"] as? String else { return }
        
        
        if isNewPost == "true" {
            self.pushToPostViewController()
        }
        completionHandler()
       
    }
    private func pushToPostViewController() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        
        if let window = windowScene?.windows.first, let rootViewController = window.rootViewController as? UINavigationController {
            let postSB = UIStoryboard.init(name: "PostSB", bundle: nil)
            let postVC = postSB.instantiateViewController(withIdentifier: "postViewControllerID") as! PostViewController
            rootViewController.pushViewController(postVC, animated: true)
        }
    }

}

//MARK: - UNUserNotificationCenterDelegate
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
    - If the app is in the foreground, the app will call this.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.list,.banner,.badge,.sound])
        
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}
*/


