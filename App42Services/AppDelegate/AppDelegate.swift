//
//  AppDelegate.swift
//  App42Services
//
//  Created by Purnima Singh on 06/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    let apiKey = "de27c4355b6410eeaabb63171eebd450b17da5fd0cf927996853eba8f4ab26d3"
    let secretKey = "f5e70b23c005d9a89edb4035f5a1a90d756fcc09a4cabaa5e945947ea7bbdbb9"

    fileprivate func createMenuView() {
        
        // create viewController code...
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "SHHomeViewController") as! SHHomeViewController
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "SHMenuViewController") as! SHMenuViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: homeViewController)
        
        UINavigationBar.appearance().tintColor = UIColor.white// UIColor_HexValue.init(hex: "689F38")
        UINavigationBar.appearance().barStyle = UIBarStyle.black
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        menuViewController.homeViewController = nvc
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: menuViewController)
//        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = homeViewController
        self.window?.backgroundColor = UIColor.black// UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.createMenuView()
        
        App42API.initialize(withAPIKey: apiKey, andSecretKey: secretKey)
        App42API.setEventBaseUrl("https://in-analytics.shephertz.com")
        App42API.setBaseUrl("https://in-api.shephertz.com")
        App42API.enableApp42Trace(true)
        App42API.enableEventService(true)
        App42API.enableAppStateEventTracking(true)
        App42API.setLoggedInUser("Purnima")
        
        
        DispatchQueue.main.async {
            self.registerPush()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        var token = ""
        for i in 0..<deviceToken.count {
            token = token + String(format: "%02.2hhx", arguments: [deviceToken[i]])
        }
        print("device token:- \(token)")
        registerUserForPushNotificationToApp42Cloud(deviceToken: token);
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("error: \(error)")
        
    }
    
    // MARK: Called when a notification is delivered to a foreground app.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("will present : =\(notification.request.content.userInfo)")
        parsePushNotification(notification: notification)
        completionHandler([.alert, .sound, .badge])
    }
    
    // MARK: receive local notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("user info: \(response.notification.request.content.userInfo)")
        let userinfo : NSDictionary = response.notification.request.content.userInfo as NSDictionary
        saveStorage(jsonString: userinfo)
        
        completionHandler()
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print("did receive remote notification \(userInfo)")
    }
    
    
    // MARK: receive remote notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print("did receive remote notification completionHandler ",userInfo);
        //        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PushNotification"), object: nil, userInfo: userInfo)
        completionHandler(.newData)
    }
    

    private func registerPush() {
        UNUserNotificationCenter.current().delegate = self
        
        // request permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) {
            (granted, error) in
            if (granted) {
                DispatchQueue.main.async(execute: {
                    UIApplication.shared.registerForRemoteNotifications()
                })
            }
        }
    }
    
    func registerUserForPushNotificationToApp42Cloud(deviceToken : String) {
        
        let pushObj = App42API.buildPushService() as! PushNotificationService
        
        pushObj.registerDeviceToken(deviceToken as String!, withUser: App42API.getLoggedInUser(), completionBlock: { (true , test, error) in
            
        })
        
    }
    
    func parsePushNotification(notification : UNNotification) {
        let userinfo = notification.request.content.userInfo
        print(userinfo)
        if let alertMessage : String = userinfo["alert"] as? String {
            print(alertMessage)
        }
        if let key1 : String = userinfo["key1"] as? String {
            print(key1)
        }
        if let key2 : String = userinfo["key2"] as? String {
            print(key2)
        }
        if let sound : String = userinfo["sound"] as? String {
            print(sound)
        }
//        print(alertMessage, sound, key1, key2)
        
    }
    
    func saveStorage(jsonString : NSDictionary) {
        let dbName = "IOSDB"
        let collectionName = "PUSHJSON"
       
        let storageService = App42API.buildStorageService() as? StorageService
        storageService?.insertJSONDocument(dbName, collectionName: collectionName, json:jsonString.jsonRepresentation(), completionBlock: { (success, response, exception) -> Void in
            if(success)      {
                let storage = response as! Storage
                NSLog("dbName is : %@", storage.dbName)
                NSLog("collectionName is : %@", storage.collectionName)
//                let jsonDocList = storage.jsonDocArray
//                for jsonDoc in jsonDocList {
//                    NSLog("Docid is : %@",jsonDoc.docId)
//                    NSLog("CreatedAt is : %@",jsonDoc.createdAt)
//                    NSLog("UpdatedAt is : %@",jsonDoc.updatedAt)
//                    NSLog("JsonDoc is : %@",jsonDoc.jsonDoc)
//
//                }
                
            }
            else
            {
//                NSLog("%@", exception.reason!)
//                NSLog("%d", exception.appErrorCode)
//                NSLog("%d", exception.httpErrorCode)
//                NSLog("%@", exception.userInfo!)
                
            }
            
        })
    }
}

