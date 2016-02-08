//
//  GiftServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 29/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class GiftServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let giftService = App42API.buildGiftService() as? GiftService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Gift Service"
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
        if cellText == "CreateGiftWithName"
        {
           createGiftWithName()
        }
        else if cellText == "DistributeGiftsWithName"
        {
           distributeGiftsWithName()
        }
        else if cellText == "SendGiftWithName"
        {
            sendGiftWithName()
        }
        else if cellText == "RequestGiftWithName"
        {
           requestGiftWithName()
        }
        else if cellText == "GetGiftRequestWithName"
        {
            getGiftRequestWithName()
        }
        else if cellText == "AcceptGiftRequestWithId"
        {
           acceptGiftRequestWithId()
        }
        else if cellText == "RejectGiftRequestWithId"
        {
            rejectGiftRequestWithId()
        }
        else if cellText == "RemoveGiftWithRequestId"
        {
           removeGiftWithRequestId()
        }
        else if cellText == "GetAllGifts"
        {
           getAllGifts()
        }
        else if cellText == "GetGiftCountWithName"
        {
           getGiftCountWithName()
        }
        else if cellText == "GetGiftByName"
        {
            getGiftByName()
        }
        else if cellText == "GetGiftsByTag"
        {
            getGiftsByTag()
        }
        else if cellText == "DeleteGiftByName"
        {
            deleteGiftByName()
        }
 
    }
    
    func createGiftWithName()
    {
        let giftName = "Power1"
        let iconPath = "File path from gallery /sd card"
        let displayName = "Power Up"
        let description = "Gift is created in App42 DataBase."
        let tag = "Entertainment"
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let giftService = App42API.buildGiftService as! GiftService
        giftService?.createGiftWithName(giftName, giftIconPath:iconPath, displayName:displayName, giftTag:tag, description:description, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let gift = response as! Gift
            NSLog("GiftName = %@",giftName);
            NSLog("DisplayName = %@",gift.displayName);
            NSLog("Description = %@",gift.description);
            NSLog("Tag = %@",gift.tag);
            NSLog("Icon url = %@",gift.icon);
            NSLog("CreatedOn = %@",gift.createdOn);
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
    
    func distributeGiftsWithName()
    {
        let giftName = "Power";
        let  recipients:NSMutableArray = NSMutableArray();
        recipients.addObject("Nick")
        let counts:Int32 = 2
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let giftService = App42API.buildGiftService() as? giftService
        giftService?.distributeGiftsWithName(giftName, to:recipients  as [AnyObject], count:counts, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let gift = response as! Gift
            NSLog("GiftName = %@",giftName);
            NSLog("DisplayName = %@",gift.displayName);
            NSLog("Description = %@",gift.description);
            NSLog("Tag = %@",gift.tag);
            NSLog("Icon url = %@",gift.icon);
            NSLog("CreatedOn = %@",gift.createdOn);
            for request in gift.requests
            {
                NSLog("Sender = %@",request.sender);
                NSLog("Recipient = %@",request.recipient);
                NSLog("Expired On = %@",request.expiration);
                NSLog("Type = %@",request.type);
                NSLog("RequestId = %@",request.requestId);
                NSLog("sentOn = %@",request.sentOn);
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
    func sendGiftWithName()
    {
        let giftName = "Power";
        let  recipients:NSMutableArray = NSMutableArray();
        recipients.addObject("John")
        recipients.addObject("Pamila")
        let message = "Keep going"
        let sender = "Nick"
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let giftService = App42API.buildGiftService() as? giftService
        giftService?.sendGiftWithName(giftName, from:sender, to:recipients as [AnyObject], withMessage:message, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
           let gift = response as! Gift
            NSLog("GiftName = %@",giftName);
            NSLog("DisplayName = %@",gift.displayName);
            NSLog("Description = %@",gift.description);
            NSLog("Tag = %@",gift.tag);
            NSLog("Icon url = %@",gift.icon);
            NSLog("CreatedOn = %@",gift.createdOn);
             for request in gift.requests
             {
                NSLog("Sender = %@",request.sender);
                NSLog("Recipient = %@",request.recipient);
                NSLog("Expired On = %@",request.expiration);
                NSLog("Type = %@",request.type);
                NSLog("RequestId = %@",request.requestId);
                NSLog("sentOn = %@",request.sentOn);
            
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
    func requestGiftWithName()
    {
        let giftName = "Power"
        let  recipients:NSMutableArray = NSMutableArray();
        recipients.addObject("John")
        recipients.addObject("Pamila")
        let message = "Keep Going...."
        let sender = "Nick"
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let giftService = App42API.buildGiftService() as? giftService
        giftService?.requestGiftWithName(giftName, from:sender, to:recipients  as [AnyObject], withMessage:message, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let gift = response as! Gift
        NSLog("GiftName = %@",gift.name);
        NSLog("DisplayName = %@",gift.displayName);
        NSLog("Description = %@",gift.description);
        NSLog("Tag = %@",gift.tag);
        NSLog("Icon url = %@",gift.icon);
        NSLog("CreatedOn = %@",gift.createdOn);
        for request in gift.requests
        {
        NSLog("Sender = %@",request.sender);
        NSLog("Recipient = %@",request.recipient);
        NSLog("Expired On = %@",request.expiration);
        NSLog("Type = %@",request.type);
        NSLog("RequestId = %@",request.requestId);
        NSLog("sentOn = %@",request.sentOn);
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
    func getGiftRequestWithName()
    {
        let giftName = "Power"
        let userName = "Pamila"
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let giftService = App42API.buildGiftService() as? giftService
        giftService?.getGiftRequestWithName(giftName, fromUser:userName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let gift = response as! Gift
        NSLog("GiftName = %@",gift.name);
        NSLog("DisplayName = %@",gift.displayName);
        NSLog("Description = %@",gift.description);
        NSLog("Tag = %@",gift.tag);
        NSLog("Icon url = %@",gift.icon);
        NSLog("CreatedOn = %@",gift.createdOn);
        for request in gift.requests
        {
        NSLog("Sender = %@",request.sender);
        NSLog("Recipient = %@",request.recipient);
        NSLog("Expired On = %@",request.expiration);
        NSLog("Type = %@",request.type);
        NSLog("RequestId = %@",request.requestId);
        NSLog("sentOn = %@",request.sentOn);
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
    func acceptGiftRequestWithId()
    {
    let requestId = "455318b-304f-4858-8b80-1001c6ab6f7c"
    let recipient = "Pamila"
   // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
    //let giftService = App42API.buildGiftService() as? giftService
        giftService?.acceptGiftRequestWithId(requestId, by: recipient, completionBlock: { (success, response, exception) -> Void in
    if (success)
    {
    let gift = response as! Gift
    NSLog("GiftName = %@",gift.name);
    NSLog("DisplayName = %@",gift.displayName);
    NSLog("Description = %@",gift.description);
    NSLog("Tag = %@",gift.tag);
    NSLog("Icon url = %@",gift.icon);
    NSLog("CreatedOn = %@",gift.createdOn);
    for request in gift.requests
    {
    NSLog("Sender = %@",request.sender);
    NSLog("Recipient = %@",request.recipient);
    NSLog("Expired On = %@",request.expiration);
    NSLog("Type = %@",request.type);
    NSLog("RequestId = %@",request.requestId);
    NSLog("sentOn = %@",request.sentOn);
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
    
    func rejectGiftRequestWithId()
    {
    let requestId = "dba3c341-e572-4a99-b0a6-0c7e0271cc3e"
    let recipient = "Pamila"
    //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
    //let giftService = App42API.buildGiftService() as? GiftService
    giftService?.rejectGiftRequestWithId(requestId, by:recipient, completionBlock: { (success, response, exception) -> Void in
    if (success)
    {
        let gift = response as! Gift
        NSLog("GiftName = %@",gift.name);
        NSLog("DisplayName = %@",gift.displayName);
        NSLog("Description = %@",gift.description);
        NSLog("Tag = %@",gift.tag);
        NSLog("Icon url = %@",gift.icon);
        NSLog("CreatedOn = %@",gift.createdOn);
        for request in gift.requests
        {
            NSLog("Sender = %@",request.sender);
            NSLog("Recipient = %@",request.recipient);
            NSLog("Expired On = %@",request.expiration);
            NSLog("Type = %@",request.type);
            NSLog("RequestId = %@",request.requestId);
            NSLog("sentOn = %@",request.sentOn);
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
    func removeGiftWithRequestId()
    {
        let  requestId = "dba3c341-e572-4a99-b0a6-0c7e0271cc3e"
        let recipient = "Pamila"
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let giftService = App42API.buildGiftService() as? GiftService
        giftService?.removeGiftWithRequestId(requestId, by:recipient, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let gift = response as! Gift
            NSLog("isSuccess = %d",gift.isResponseSuccess);
            NSLog("Response=%@",gift.strResponse);
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
    func getAllGifts()
    {
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let giftService = App42API.buildGiftService() as? GiftService
        giftService?.getAllGifts( {(success, response, exception) -> Void in
        if (success)
        {
        let list = response as! NSArray
        for gift in list
        {
            NSLog("GiftName = %@",gift.name);
            NSLog("DisplayName = %@",gift.displayName);
            NSLog("Description = %@",gift.description);
            NSLog("Tag = %@",gift.tag);
            NSLog("Icon url = %@",gift.icon);
            NSLog("CreatedOn = %@",gift.createdOn);
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
    func getGiftCountWithName()
    {
        let giftName = "Power"
        let userName = "John"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let giftService = App42API.buildGiftService() as? GiftService
        giftService?.getGiftCountWithName(giftName, forUser:userName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let gift = response as! Gift
        NSLog("isResponseSuccess = %d",gift.isResponseSuccess);
        NSLog("Response = %",gift.strResponse);
        NSLog("Total Gifts = %d",gift.totalRecords);
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
    func getGiftByName()
    {
    let giftName = "Power"
    //App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
    //let giftService = App42API.buildGiftService() as? GiftService
    giftService?.getGiftByName(giftName, completionBlock: { (success, response, exception) -> Void in
    if (success)
    {
        let gift = response as! Gift
        NSLog("GiftName = %@",gift.name);
        NSLog("DisplayName = %@",gift.displayName);
        NSLog("Description = %@",gift.description);
        NSLog("Tag = %@",gift.tag);
        NSLog("Icon url = %@",gift.icon);
        NSLog("CreatedOn = %@",gift.createdOn);
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
    func getGiftsByTag()
    {
        let tagName = "Entertainment"
        giftService?.getGiftsByTag(tagName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let list = response as! NSArray
        for gift in list
        {
            NSLog("GiftName = %@",gift.name);
            NSLog("DisplayName = %@",gift.displayName);
            NSLog("Description = %@",gift.description);
            NSLog("Tag = %@",gift.tag);
            NSLog("Icon url = %@",gift.icon);
            NSLog("CreatedOn = %@",gift.createdOn);
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
    func deleteGiftByName()
    {
        let giftName = "Power1"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let giftService = App42API.buildGiftService() as? GiftService
        giftService?.deleteGiftByName(giftName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let gift = response as! Gift
            NSLog("isSuccess = %d",gift.isResponseSuccess);
            NSLog("Response=%@",gift.strResponse);
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
