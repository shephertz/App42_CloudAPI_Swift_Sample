//
//  BuddyServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 21/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class BuddyServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let buddyService = App42API.buildBuddyService() as? BuddyService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Buddy Service"
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        if cellText == "SendFriendRequestFromUser"
        {
            sendFriendRequestFromUser()
        }
        else if cellText == "GetFriendRequest"
        {
            getFriendRequestFromUser()
        }
        else if cellText == "AcceptFriendRequestFromBuddy"
        {
            acceptFriendRequestFromBuddy()
        }
        else if cellText == "RejectFriendRequestFromBuddy"
        {
            rejectFriendRequestFromBuddy()
        }
        else if cellText == "GetAllFriends"
        {
            getAllFriends()
        }
        else if cellText == "CreateGroup"
        {
            createGroup()
        }
        else if cellText == "AddFriends"
        {
           addFriends()
        }
        else if cellText == "CheckedInWithUser"
        {
           checkedInWithUser()
        }
        else if cellText == "GetFriendsOfUser"
        {
            getFriendsOfUser()
        }
        else if cellText == "GetAllGroups"
        {
            getAllGroups()
        }
        else if cellText == "GetAllFriendsOfUser"
        {
             getAllFriendsOfUser()
        }
        else if cellText == "BlockFriendRequestFromBuddy"
        {
            blockFriendRequestFromBuddy()
        }
        else if cellText == "BlockBuddy"
        {
            blockBuddy()
        }
        else if cellText == "UnblockBuddy"
        {
            unblockBuddy()
        }
        else if cellText == "SendMessageToGroup"
        {
            sendMessageToGroup()
        }
        else if cellText == "SendMessageToFriend"
        {
            sendMessageToFriend()
        }
        else if cellText == "GetAllMessages"
        {
            getAllMessages()
        }
        else if cellText == "GetAllMessagesFromBuddy"
        {
            getAllMessagesFromBuddy()
        }
        else if cellText == "GetAllMessagesFromGroup"
        {
            getAllMessagesFromGroup()
        }
        else if cellText == "DeleteMessageById"
        {
            deleteMessageById()
        }
        else if cellText == "DeleteMessageByIds"
        {
            deleteMessageByIds()
        }
        else if cellText == "UnFriend"
        {
            unFriend()
        }
        
       
       
    }
    
    func sendFriendRequestFromUser()
    {
        let  userName = "b9"
        let buddyName = "bhavs"
        let  message = "Welcome to Shephertz"
        buddyService?.sendFriendRequestFromUser(userName, toBuddy:buddyName, withMessage:message, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let buddy = response as! Buddy
                NSLog("userName is : %@", buddy.userName)
                NSLog("buddyName is : %@", buddy.buddyName)
                NSLog("message is : %@", buddy.message)
                NSLog("sendedOn is : %@", buddy.sendedOn)
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
    
    func getFriendRequestFromUser()
    {
        let  userName = "John"
        buddyService?.getFriendRequest(userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let list = response as! NSArray
                for buddy in list
                {
                    NSLog("userName is : %@", buddy.userName);
                    NSLog("buddyName is : %@", buddy.buddyName);
                    NSLog("message is : %@", buddy.message);
                    NSLog("sendedOn is : %@", buddy.sendedOn);
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
    func acceptFriendRequestFromBuddy()
    {
        let  userName = "bhavs"
        let buddyName = "b9"
        buddyService?.acceptFriendRequestFromBuddy(buddyName, toUser:userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
                {
                    let buddy = response as! Buddy
                    NSLog("userName is : %@", buddy.userName);
                    NSLog("buddyName is : %@", buddy.buddyName);
                    NSLog("sendedOn is : %@", buddy.sendedOn);
                    NSLog("acceptedOn is : %@", buddy.acceptedOn);
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
    func rejectFriendRequestFromBuddy()
    {
        let  userName = "Nick"
        let buddyName = "John"
        buddyService?.rejectFriendRequestFromBuddy(userName, toUser:buddyName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let buddy = response as! Buddy
                NSLog("userName is : %@", buddy.userName);
                NSLog("buddyName is : %@", buddy.buddyName);
                NSLog("sendedOn is : %@", buddy.sendedOn);
                NSLog("acceptedOn is : %@", buddy.acceptedOn);
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
    func getAllFriends()
    {
        let userName = "Bhavika"
        let buddyName = "Rajeev"
        buddyService?.getAllFriends(userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let list = response as! NSArray
                for buddy in list
                {
                    NSLog("userName is : %@", buddy.userName);
                    NSLog("buddyName is : %@", buddy.buddyName);
                    NSLog("message is : %@", buddy.message);
                    NSLog("sendedOn is : %@", buddy.sendedOn);
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
    
    func createGroup()
    {
        let userName = "b9"
        let groupName = "G9"
        buddyService?.createGroup(groupName, byUser:userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let buddy = response as! Buddy
                NSLog("userName is : %@", buddy.userName);
                NSLog("groupName is : %@", buddy.groupName);
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
    
    func addFriends()
    {
        let  userName = "b9"
        let groupName  = "G9"
        let friendsArray:NSMutableArray = NSMutableArray();
        friendsArray.addObject("bhavs")
        friendsArray.addObject("NBhavi")
        buddyService?.addFriends(friendsArray as [AnyObject], ofUser:userName, toGroup:groupName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let list = response as! NSArray
                for buddy in list
                {
                    NSLog("userName is : %@", buddy.userName);
                    NSLog("buddyName is : %@", buddy.groupName);
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
    
    func checkedInWithUser()
    {
        let  userName = "Nick"
        let geoPoint:GeoPoint = GeoPoint()
        geoPoint.latitude = 12.0
        geoPoint.longitude = 41.0
        geoPoint.marker="Maplewood"
        buddyService?.checkedInWithUser(userName, geoLocation: geoPoint, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let buddy = response as! Buddy
                NSLog("userName is : %@", buddy.userName);
                for point in buddy.pointList
                {
                    NSLog("latitude is : %f", point.latitude);
                    NSLog("longitude is : %f", point.longitude);
                    NSLog("markerName is : %@", point.markerName);
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
    
    func getFriendsOfUser()
        {
            let userName = "bhavika"
            let latitude = 55.00
            let longitude = 73.00
            let radius = 100.00
            let max:Int32 = 10
            
            buddyService?.getFriendsOfUser(userName, withLatitude:latitude, andLongitude:longitude, inRadius:radius, max: max, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let list = response as! NSArray
                for buddy in list
                {
                    NSLog("userName is : %@", buddy.userName);
                    let pointList = response as! [GeoPoint]
                    for buddyPoint in pointList
                    {
                        NSLog("MarkerName=%@",buddyPoint.marker);
                        NSLog("Latitude=%lf",buddyPoint.latitude);
                        NSLog("Longitude=%lf",buddyPoint.longitude);
                    }
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

    func getAllGroups()
    {
        let  userName = "b4"
        buddyService?.getAllGroups(userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
           let list = response as! NSArray
           for buddy in list
            {
                NSLog("userName is : %@", buddy.userName);
                NSLog("GroupName is : %@", buddy.groupName);
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

    func getAllFriendsOfUser()
    {
        let userName = "b4"
        let groupName = "Group Name"
        let ownerName = "Owner Name"
        buddyService?.getAllFriendsOfUser(userName, inGroup:groupName, ofOwner:ownerName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
            {
                let list = response as! NSArray
                for buddy in list
                {
                    NSLog("userName is : %@", buddy.userName);
                    NSLog("buddyName is : %@", buddy.buddyName);
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
    
    func blockFriendRequestFromBuddy()
    {
        let userName = "b";
        let buddyName = "a";
        buddyService?.blockFriendRequestFromBuddy(buddyName, toUser:userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
            {
                let buddy = response as! Buddy
                NSLog("userName is : %@",buddy.userName);
                NSLog("buddyName is : %@",buddy.buddyName);
                NSLog("sendedOn is : %@",buddy.sendedOn);
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
    
    func blockBuddy()
    {
        let userName = "bhavika";
        let buddyName = "rajeev";
        buddyService?.blockBuddy(buddyName, byUser:userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
            {
                let buddy = response as! Buddy
                NSLog("userName is : %@",buddy.userName);
                NSLog("buddyName is : %@",buddy.buddyName);
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
    
    func unblockBuddy()
    {
        let userName = "bhavika";
        let buddyName = "rajeev";
        buddyService?.unblockBuddy(buddyName, byUser:userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
            {
                let buddy = response as! Buddy
                NSLog("userName is :%@",buddy.userName);
                NSLog("buddyName is :%@",buddy.buddyName);
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
    
    func sendMessageToGroup()
    {
    let userName = "b9";
    let message = "Welcome to Shephertz"
    let groupName = "g9"
    let ownerName = "b9"
        buddyService?.sendMessage(message, fromUser: userName, toGroup: groupName, ofGroupOwner: ownerName, completionBlock: { (success, response, exception) -> Void in
    if (success)
        {
            let buddy = response as! Buddy
            NSLog("userName is : %@",buddy.userName);
            NSLog("buddyName is : %@", buddy.buddyName);
            NSLog("message is : %@", buddy.message);
            NSLog("sendedOn is : %@", buddy.messageId);
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
    
    func sendMessageToFriend()
    {
        let userName = "b9";
        let  message = "Hi"
        buddyService?.sendMessageToFriends(message, fromUser:userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let list = response as! NSArray
        for buddy in list
        {
            NSLog("userName is : %@",buddy.userName);
            NSLog("buddyName is : %@", buddy.buddyName);
            NSLog("message is : %@", buddy.message);
            NSLog("messageid is : %@", buddy.messageId);
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
    
    func getAllMessages()
    {
        let userName = "b9";
        buddyService?.getAllMessages(userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
         let list = response as! NSArray
         for buddy in list
          {
            NSLog("userName is : %@",buddy.userName);
            NSLog("message is : %@", buddy.message);
            NSLog("messageID is : %@", buddy.messageId);
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
    
   func getAllMessagesFromBuddy()
   {
    let userName = "bhavs"
    let buddyName = "b9"
    buddyService?.getAllMessagesFromBuddy(buddyName, toUser:userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
         let message = response as! NSArray
         for buddy in message
            {
                NSLog("userName is : %@",buddy.userName);
                NSLog("ownerName is = %@ " , buddy.ownerName);
                NSLog("message is : %@",buddy.message);
                NSLog("messageId is : %@",buddy.messageId);
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
    
    func getAllMessagesFromGroup()
    {
        let userName = "b9"
        let groupOwner = "b9"
        let groupName = "g9"
        buddyService?.getAllMessagesFromGroup(groupName, ofGroupOwner:groupOwner, toUser:userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
         let message = response as! NSArray
         for buddy in message
            {
                NSLog("userName is : %@",buddy.userName);
                NSLog("ownerName is = %@ " , buddy.ownerName);
                NSLog("message is : %@",buddy.message);
                NSLog("messageId is : %@",buddy.messageId);
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
    
    func deleteMessageById()
    {
        let userName = "b9";
        let  messageId = "562e2a4ae4b01f95b6399f82"
        buddyService?.deleteMessageById(messageId, userName:userName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let buddy = response as! App42Response
            NSLog("%@", buddy.strResponse)
            NSLog("%d", buddy.totalRecords)
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
    
    func deleteMessageByIds()
    {
        let userName = "b9"
        let  messageIds:NSMutableArray = NSMutableArray();
        messageIds.addObject("562e2a4ae4b01f95b6399f82")
        buddyService?.deleteMessageByIds(messageIds as [AnyObject], userName:userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let buddy = response as! App42Response
                NSLog("%@", buddy.strResponse)
                NSLog("%d", buddy.totalRecords)
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
 
    func unFriend()
    {
        let userName = "b9";
        let buddyName = "bhavs"
        buddyService?.unFriend(userName, buddyName:buddyName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let buddy = response as! App42Response
            NSLog("%@", buddy.strResponse)
            NSLog("%d", buddy.totalRecords)
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