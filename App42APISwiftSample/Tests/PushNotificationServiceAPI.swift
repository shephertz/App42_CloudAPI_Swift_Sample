//
//  PushNotificationServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class PushNotificationServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var pushNotificationService:PushNotificationService? = nil
    var sessionId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "PushNotification Service"
        pushNotificationService = App42API.buildPushService() as? PushNotificationService
        sessionId = nil;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return (apiList?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) 
        if cell == NSNull()
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        // Configure the cell...
        let index = indexPath.row
        cell.textLabel!.text = apiList?.objectAtIndex(index) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let cellText = cell?.textLabel!.text
        if cellText == "RegisterDeviceToken"
        {
            RegisterDeviceToken()
        }
        else if cellText == "CreateChannelForApp"
        {
            CreateChannelForApp()
        }
        else if cellText == "SubscribeToChannel"
        {
            SubscribeToChannel()
        }
        else if cellText == "UnsubscribeFromChannel"
        {
            UnsubscribeFromChannel()
        }
        else if cellText == "SubscribeToChannelWithDeviceToken"
        {
            SubscribeToChannelWithDeviceToken()
        }
        else if cellText == "SubscribeToChannelWithTokenType"
        {
            SubscribeToChannelWithDeviceTokenAndType()
        }
        else if cellText == "UnsubscribeDeviceToChannel"
        {
            UnsubscribeDeviceToChannel()
        }
        else if cellText == "SendPushMessageToChannel"
        {
            SendPushMessageToChannel()
        }
        else if cellText == "SendPushMessageDictToChannel"
        {
            SendPushMessageDictToChannel()
        }
        else if cellText == "SendPushMessageToAll"
        {
            SendPushMessageToAll()
        }
        else if cellText == "SendPushMessageToiOS"
        {
            SendPushMessageToiOS()
        }
        else if cellText == "SendPushMessageToAndroid"
        {
           SendPushMessageToAndroid()
        }
        else if cellText == "SendPushMessageToUser"
        {
            SendPushMessageToUser()
        }
        else if cellText == "SendPushMessageDictToUser"
        {
            SendPushMessageDictToUser()
        }
        else if cellText == "SendPushToTargetUsers"
        {
            SendPushToTargetUsers()
        }
        else if cellText == "SendPushMessageToGroup"
        {
            SendPushMessageToGroup()
        }
        else if cellText == "SendMessageToInActiveUsersFromDate"
        {
            SendMessageToInActiveUsersFromDate()
        }
        else if cellText == "ScheduleMessageToUser"
        {
            ScheduleMessageToUser()
        }
        else if cellText == "DeleteDeviceToken"
        {
            DeleteDeviceToken()
        }
        else if cellText == "DeleteAllDevices"
        {
            DeleteAllDevices()
        }
        else if cellText == "UnsubscribeDeviceForUser"
        {
            UnsubscribeDeviceForUser()
        }
        else if cellText == "ResubscribeDeviceForUser"
        {
            ResubscribeDeviceForUser()
        }
        else if cellText == "SendPushMessageToDevice"
        {
            SendPushMessageToDevice()
        }
        else if cellText == "UpdatePushBadgeforDevice"
        {
            UpdatePushBadgeforDevice()
        }
        else if cellText == "UpdatePushBadgeforUser"
        {
            UpdatePushBadgeforUser()
        }
        else if cellText == "DeleteChannel"
        {
            DeleteChannel()
        }
    }
    func RegisterDeviceToken()
    {
        let userName = "Bhavika"
        let deviceToken = "123"
        pushNotificationService?.registerDeviceToken(deviceToken, withUser:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func CreateChannelForApp()
    {
        NSLog("CreateChannelForApp")
        let channel = "AajTak"
        let description = "123456"
        pushNotificationService?.createChannelForApp(channel, description: description,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                let channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                    NSLog("%@", channel.description)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func SubscribeToChannel()
    {
        NSLog("SubscribeToChannel")
        let channel = "AajTak"
        let userName = "Bhavika"
        pushNotificationService?.subscribeToChannel(channel, userName: userName,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                let channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func UnsubscribeFromChannel()
    {
        
        let channel = "AajTak"
        let userName = "Bhavika"
        pushNotificationService?.unsubscribeFromChannel(channel, userName: userName,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                let channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func SubscribeToChannelWithDeviceToken()
    {
        let channel = "AajTak"
        let userName = "Bhavs"
        let deviceToken = "1233"
        pushNotificationService?.subscribeToChannel(channel, userName: userName,deviceToken:deviceToken,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                let channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func SubscribeToChannelWithDeviceTokenAndType()
    {
        let channel = "AajTak"
        let userName = "HimanshuSSharma"
        let deviceToken = "HimanshuSSharma"
        pushNotificationService?.subscribeToChannel(channel, userName: userName,deviceToken:deviceToken,deviceType:"Android",completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                let channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func UnsubscribeDeviceToChannel()
    {
        let channel = "AajTak"
        let userName = "HimanshuSSharma"
        let deviceToken = "HimanshuSSharma"
        pushNotificationService?.unsubscribeDeviceToChannel(channel, userName: userName,deviceToken:deviceToken,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                let channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func SendPushMessageToChannel()
    {
        let channel = "AajTak"
        let message = "Hi"
        pushNotificationService?.sendPushMessageToChannel(channel, withMessage:message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
                let channelList  = pushNotification.channelList
                for channel in channelList {
                    NSLog("%@", channel.channelName)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func SendPushMessageDictToChannel()
    {
        let channel = "AajTak"
        let message =  NSMutableDictionary()
        message["alert"] = "Hello! This is my first notification."
        message["sound"] = "default"
        message["badge"] = "2"
        pushNotificationService?.sendPushMessageToChannel(channel, withMessageDictionary:message as [NSObject : AnyObject],completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func SendPushMessageDictToUser()
    {
        let userName = "HimanshuSSharma"
        let message = NSMutableDictionary()
        message["alert"] = "Hello! This is my first notification."
        message["sound"] = "default"
        message["badge"] = "2"
        pushNotificationService?.sendPushMessageToUser(userName, withMessageDictionary:message as [NSObject : AnyObject],completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func SendPushMessageToAll()
    {
        let message = "Hi All"
        pushNotificationService?.sendPushMessageToAll(message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func SendPushMessageToiOS()
    {
        let message = "Hi All"
        pushNotificationService?.sendPushMessageToiOS(message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func SendPushMessageToAndroid()
    {
        let message = "Hi All"
        pushNotificationService?.sendPushMessageToAndroid(message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func SendPushMessageToUser()
    {
        let userName = "Bhavika"
        let message = "Hi All"
        pushNotificationService?.sendPushMessageToUser(userName,message:message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func SendPushToTargetUsers()
    {
        let message = "Hi All"
        let key = "Name"
        let value = "Bhavs"
        let dbName = "Test"
        let collectionName = "Demo"
        let query:Query = QueryBuilder.buildQueryWithKey(key, value:value, andOperator:APP42_OP_EQUALS)
        pushNotificationService?.sendPushToTargetUsers(message,dbName:dbName,collectionName:collectionName,query:query,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func SendPushMessageToGroup()
    {
        let userName = "bhavika"
        let userList = ["Nick",userName]
        let message = "Hi All"
        pushNotificationService?.sendPushMessageToGroup(userList,message:message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func ScheduleMessageToUser()
    {
        let userName = "HimanshuSSharma"
        let message = "Hi All"
        let expiryDate = NSDate()
        pushNotificationService?.scheduleMessageToUser(userName,expiryDate:expiryDate,message:message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func SendMessageToInActiveUsersFromDate()
    {
        let message = "Hi All"
        let startDate = NSDate().laterDate(NSDate())
        let expiryDate = NSDate()
        pushNotificationService?.sendMessageToInActiveUsersFromDate(startDate,toDate:expiryDate,message:message,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    
    func DeleteDeviceToken()
    {
        let userName = "Bhavs"
        let deviceToken = "1234"
        pushNotificationService?.deleteDeviceToken(userName,deviceToken:deviceToken,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let app42response = response as! App42Response
                NSLog("%@", app42response.isResponseSuccess)
                NSLog("%@", app42response.strResponse)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func DeleteAllDevices()
    {
        let userName = "Bhavs"
        pushNotificationService?.deleteAllDevices(userName,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let app42response = response as! App42Response
                NSLog("%@", app42response.isResponseSuccess)
                NSLog("%@", app42response.strResponse)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func UnsubscribeDeviceForUser()
    {
        let userName = "Bhavs"
        let deviceToken = "1234"
        pushNotificationService?.unsubscribeDeviceForUser(userName,deviceToken:deviceToken,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func ResubscribeDeviceForUser()
    {
        let userName = "bhavs"
        let deviceToken = "1234"
        pushNotificationService?.resubscribeDeviceForUser(userName,deviceToken:deviceToken,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
    func SendPushMessageToDevice()
    {
        let userName = "HimanshuSSharma"
        let deviceToken = "HimanshuSSharma"
        pushNotificationService?.sendPushMessageToDevice(deviceToken,userName:userName,message:"Hi Testing ios",completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.message)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func UpdatePushBadgeforDevice()
    {
        let userName = "HimanshuSSharma"
        let deviceToken = "HimanshuSSharma"
        let badges:Int32 = 10
        pushNotificationService?.updatePushBadgeforDevice(deviceToken,userName:userName,badges:badges,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.userName)
                NSLog("%@", pushNotification.deviceToken)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func UpdatePushBadgeforUser()
    {
        let userName = "HimanshuSSharma"
        let badges:Int32 = 10
        pushNotificationService?.updatePushBadgeforUser(userName,badges:badges,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let pushNotification = response as! PushNotification
                NSLog("%@", pushNotification.userName)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    func DeleteChannel()
    {
        let channel = "AajTak"
        pushNotificationService?.deleteChannel(channel,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let app42response = response as! App42Response
                NSLog("%@", app42response.isResponseSuccess)
                NSLog("%@", app42response.strResponse)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
    }
    
}