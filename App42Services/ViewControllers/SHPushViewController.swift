//
//  SHPushViewController.swift
//  App42Services
//
//  Created by Purnima Singh on 07/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//

import UIKit

class SHPushViewController: UIViewController {

    var isFromMenu : Bool!
    
    @IBOutlet weak var sendPushButton: UIButton!
    @IBOutlet weak var sendAdvancePush: UIButton!
    @IBOutlet weak var sendRichPush: UIButton!
    
    let pushNotificationService = App42API.buildPushService() as! PushNotificationService

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFromMenu {
            self.setNavigationBarItem()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Push"
        
        self.view.backgroundColor = UIColor.black

        self.sendPushButton.layer.cornerRadius = 10
        self.sendPushButton.setTitle("Send Push", for: .normal)
        self.sendPushButton.titleLabel?.font = UIFont.init(name: "Montserrat-Light.ttf", size: 16.0)
        self.sendPushButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        self.sendPushButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        
        self.sendAdvancePush.layer.cornerRadius = 10
        self.sendAdvancePush.setTitle("Send Advanced Push", for: .normal)
        self.sendAdvancePush.titleLabel?.font = UIFont.init(name: "Montserrat-Light.ttf", size: 16.0)
        self.sendAdvancePush.setTitleColor(UIColor.lightGray, for: .highlighted)
        self.sendAdvancePush.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        
        self.sendRichPush.layer.cornerRadius = 10
        self.sendRichPush.setTitle("Send Rich Push", for: .normal)
        self.sendRichPush.titleLabel?.font = UIFont.init(name: "Montserrat-Light.ttf", size: 16.0)
        self.sendRichPush.setTitleColor(UIColor.lightGray, for: .highlighted)
        self.sendRichPush.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendPushButtonClick(_ sender: UIButton) {
        self.sendPushButton.isHighlighted = true
        
        let messageStr = "Test Push Notification on Device"
        pushNotificationService.sendPushMessage(toUser: App42API.getLoggedInUser(), message: messageStr) { (success, response, exception) in
            if(success)  {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
                
            }  else  {
                print(exception?.reason! ?? "reason")
                print( exception?.appErrorCode ?? "appErrorCode")
                print(exception?.httpErrorCode ?? "httpErrorCode")
                print(exception?.userInfo! as Any)
                
                let errorStr : String = exception?.userInfo!["details"] as! String
                self.showAlertView(message: errorStr)
            }
            self.sendPushButton.isHighlighted = false
        }
    }
    
    @IBAction func sendAdvancePushButtonClick(_ sender: UIButton) {
        
        self.sendAdvancePush.isHighlighted = true

        
        let messageStr = "Test Advance Push Notification on Device"
        let messageDict : NSMutableDictionary = NSMutableDictionary.init()
        messageDict.setObject(messageStr, forKey:"alert"  as NSCopying)
        messageDict.setObject("default", forKey: "sound" as NSCopying)
        messageDict.setObject("value1", forKey: "key1" as NSCopying)
        messageDict.setObject("value2", forKey: "key2" as NSCopying)
        
        print(messageDict)

        pushNotificationService.sendPushMessage(toUser: App42API.getLoggedInUser(), withMessageDictionary: messageDict as! [AnyHashable : Any]) { (success, response, exception) in
            if(success)  {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
                
            }  else  {
                print(exception?.reason! ?? "reason")
                print( exception?.appErrorCode ?? "appErrorCode")
                print(exception?.httpErrorCode ?? "httpErrorCode")
                print(exception?.userInfo! as Any)
                
                let errorStr : String = exception?.userInfo!["details"] as! String
                self.showAlertView(message: errorStr)
            }
            
            self.sendAdvancePush.isHighlighted = false
        }
        
        /*
         
         {
         "_App42Convert": true,
         "_app42RichPush": "{\"content\":\"https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg\",\"type\":\"image\"}",
         "aps": {
            "alert": "category test 1",
            "mutable-content": 1,
         
            "category" : "myCategoryIdentifier",
         
            "sound": "defaul"
            },
         }
         
         
         */
    }
    
    @IBAction func sendRichPushButtonClick(_ sender: UIButton) {
        
        self.sendRichPush.isHighlighted = true
        
        let messageStr = "{\"_app42RichPush\": {\"content\": \"https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg\",\"A\": \"AQ\",\"type\": \"image\"  }, \"_App42Convert\": true,\"alert\": \"IMAGECHECK\",\"mutable-content\": 1 }"
        
        pushNotificationService.sendPushMessage(toUser: App42API.getLoggedInUser(), message: messageStr) { (success, response, exception) in
            if(success)  {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
                
            }  else  {
                print(exception?.reason! ?? "reason")
                print( exception?.appErrorCode ?? "appErrorCode")
                print(exception?.httpErrorCode ?? "httpErrorCode")
                print(exception?.userInfo! as Any)
                
                let errorStr : String = exception?.userInfo!["details"] as! String
                self.showAlertView(message: errorStr)
            }
            
            self.sendRichPush.isHighlighted = false
        }
                          
    }
    
    
    func showAlertView(message : String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                print("ok")
            }
            alertController.addAction(yesAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
