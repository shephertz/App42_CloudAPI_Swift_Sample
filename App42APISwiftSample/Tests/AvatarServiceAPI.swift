//
//  AvatarService.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 28/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

 class AvatarServiceAPI: UITableViewController{

    var apiList:NSArray? = nil
    let avatarService = App42API.buildAvatarService() as? AvatarService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Avatar Service"
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
        if cellText == "CreateAvatarWithName"
        {
            createAvatarWithName()
        }
        else if cellText == "CreateAvatarFromFileDataWithName"
        {
            createAvatarFromFileDataWithName()
        }
        else if cellText == "CreateAvatarFromFacebookWithName"
        {
      //      createAvatarFromFacebookWithName()
        }
        else if cellText == "CreateAvatarFromWebURLWithName"
        {
         //   createAvatarFromWebURLWithName()
        }
        else if cellText == "GetAvatarByName"
        {
       //    getAvatarByName()
        }
        else if cellText == "GetAllAvatarsForUser"
        {
        //   getAllAvatarsForUser()
        }
        else if cellText == "GetCurrentAvatar"
        {
        //    getCurrentAvatar()
        }
        else if cellText == "ChangeCurrentAvatarWithName"
        {
          //  changeCurrentAvatarWithName()
        }
    }
    func createAvatarWithName()
    {
        let avatarName = "Shephertz Nick"
        let userName = "Nick"
        let filePath = "Your File Path"
        let description = "My Profile Pic"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let avatarService = App42API.buildAvatarService() as? AvatarService
        avatarService?.createAvatarWithName(avatarName, userName: userName, filePath: filePath, description: description, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let avatar = response as! Avatar
            NSLog("%@",avatar.name)
            NSLog("%@",avatar.tinyUrl)
            NSLog("%@",avatar.userName)
            NSLog("%d",avatar.isCurrent)
        }
        else
        {
            NSLog("%@",exception.reason!)
            NSLog("%d",exception.httpErrorCode)
            NSLog("%d",exception.appErrorCode)
            NSLog("%@",exception.userInfo!)
        }
     })
    }
    
    func createAvatarFromFileDataWithName()
    {
        let avatarName = "Shephertz Nick"
        let userName = "Nick"
        let filePath = NSBundle.mainBundle().pathForResource("Image", ofType: "png")
        let description = "My Profile Pic"
        let data = NSData(contentsOfFile:filePath!)
        NSLog("Data = %@", data!)
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
    
        //let avatarService = App42API.buildAvatarService() as? AvatarService
        
        avatarService?.createAvatarFromFileDataWithName(avatarName, userName: userName, fileData:data, description:description, `extension`:"png", completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let avatar = response as! Avatar
                NSLog("%@",avatar.name)
                NSLog("%@",avatar.tinyUrl)
                NSLog("%@",avatar.userName)
                NSLog("%d",avatar.isCurrent)
            }  
            else  
            {  
                NSLog("%@",exception.reason!)
                NSLog("%d",exception.httpErrorCode)  
                NSLog("%d",exception.appErrorCode)  
                NSLog("%@",exception.userInfo!)  
            }  
         })
    }
    
   func createAvatarFromFacebookWithName()
    {
        let avatarName = "Shephertz Nick"
        let userName = "Nick"
        let accessToken  = "<Enter Your Facebook Access Token>"
        let description = "My Profile Pic"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let avatarService = App42API.buildAvatarService() as? AvatarService
        avatarService?.createAvatarFromFacebookWithName(avatarName, userName: userName, accessToken:accessToken, description: description, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let avatar = response as! Avatar
            NSLog("%@",avatar.name)
            NSLog("%@",avatar.tinyUrl)
            NSLog("%@",avatar.userName)
            NSLog("%d",avatar.isCurrent)
        }
        else
        {
            NSLog("%@",exception.reason!)
            NSLog("%d",exception.httpErrorCode)
            NSLog("%d",exception.appErrorCode)
            NSLog("%@",exception.userInfo!)
        }
     })
    }
    
    func createAvatarFromWebURLWithName()
    {
        let avatarName = "Shephertz Nick"
        let userName = "Nick"
        let webUrl   = "<Enter the WebURL>"
        let description = "My Profile Pic"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let avatarService = App42API.buildAvatarService() as? AvatarService
        avatarService?.createAvatarFromWebURLWithName(avatarName, userName: userName, webUrl: webUrl, description: description, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let avatar = response as! Avatar
            NSLog("%@",avatar.name)
            NSLog("%@",avatar.tinyUrl)
            NSLog("%@",avatar.userName)
            NSLog("%d",avatar.isCurrent)
        }
        else
        {
            NSLog("%@",exception.reason!)
            NSLog("%d",exception.httpErrorCode)
            NSLog("%d",exception.appErrorCode)
            NSLog("%@",exception.userInfo!)
        }
      })
    }
 func getAvatarByName()
    {
        let avatarName = "Shephertz Nick"
        let userName = "Nick"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let avatarService = App42API.buildAvatarService() as? AvatarService
        avatarService?.getAvatarByName(avatarName, userName: userName, completionBlock: { (success, response, exception) -> Void in
        if (success)
            {
                let avatar = response as! Avatar
                NSLog("%@",avatar.name)
                NSLog("%@",avatar.tinyUrl)
                NSLog("%@",avatar.userName)
                NSLog("%d",avatar.isCurrent)
            }
        else
            {
                NSLog("%@",exception.reason!)
                NSLog("%d",exception.httpErrorCode)
                NSLog("%d",exception.appErrorCode)
                NSLog("%@",exception.userInfo!)
            }
        })
    }
    
    func getAllAvatarsForUser()
    {
        let userName = "Nick"
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let avatarService = App42API.buildAvatarService() as? AvatarService
        avatarService?.getAllAvatarsForUser(userName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let avatarArray =  response as! NSArray
            for avatar in avatarArray
            {
            NSLog("%@",avatar.name)
            NSLog("%@",avatar.tinyUrl)
            NSLog("%@",avatar.userName)
            NSLog("%d",avatar.isCurrent)
            }
        }
        else
        {
            NSLog("%@",exception.reason!)
            NSLog("%d",exception.httpErrorCode)
            NSLog("%d",exception.appErrorCode)
            NSLog("%@",exception.userInfo!)
        }
      })
    }
        
    func getCurrentAvatar()
        {
            let userName = "Nick"
            //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
            //let avatarService = App42API.buildAvatarService() as? AvatarService
            avatarService?.getCurrentAvatar(userName, completionBlock: { (success, response, exception) -> Void in                    if (success)
                    {
                        let avatar = response as! Avatar
                        NSLog("%@",avatar.name)
                        NSLog("%@",avatar.tinyUrl)
                        NSLog("%@",avatar.userName)
                        NSLog("%d",avatar.isCurrent)
                    }
                    else
                    {  
                        NSLog("%@",exception.reason!)
                        NSLog("%d",exception.httpErrorCode)  
                        NSLog("%d",exception.appErrorCode)  
                        NSLog("%@",exception.userInfo!)  
                    }  
                })
        }
        
        func changeCurrentAvatarWithName()
        {
            let avatarName = "Shephertz Nick"
            let userName = "Nick"
           // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
           // let avatarService = App42API.buildAvatarService() as? AvatarService
            avatarService?.changeCurrentAvatarWithName(avatarName, forUser: userName, completionBlock: { (success, response, exception) -> Void in
                    if (success)
                    {
                        let avatar = response as! Avatar
                        NSLog("%@",avatar.name)
                        NSLog("%@",avatar.tinyUrl)
                        NSLog("%@",avatar.userName)
                        NSLog("%d",avatar.isCurrent)
                    }
                    else
                    {  
                        NSLog("%@",exception.reason!)
                        NSLog("%d",exception.httpErrorCode)  
                        NSLog("%d",exception.appErrorCode)  
                        NSLog("%@",exception.userInfo!)  
                    }  
                })
        }
        
      /*  func updateAvatar()
        {
            let avatarName = "Shephertz Nick"
            let userName = "Nick"
            let newAvatarName = "Shephertz John"
            //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
            //let avatarService = App42API.buildAvatarService() as? AvatarService
            avatarService?.updateAvatar(avatarName, userName, newAvatarName, completionBlock: { (success, response, exception) -> Void in
                if (success)
                    {
                        let avatar = response as! Avatar
                        NSLog("%@",avatar.name)
                        NSLog("%@",avatar.tinyUrl)
                        NSLog("%@",avatar.userName)
                        NSLog("%d",avatar.isCurrent)
                    }
                    else  
                    {  
                        NSLog("%@",exception.reason!)
                        NSLog("%d",exception.httpErrorCode)  
                        NSLog("%d",exception.appErrorCode)  
                        NSLog("%@",exception.userInfo!)  
                    }  
                })
        }
    
        func deleteAvatarByName()
        {
            let userName = "Nick"
            //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
            //let avatarService = App42API.buildAvatarService() as? AvatarService
            avatarService?.deleteAvatarByName(userName, completionBlock:{ (success, response, exception) -> Void in
                if(success)
                    {
                        let response = response as! App42Response
                        NSLog("%@", response.strResponse)
                        NSLog("%@", response.isResponseSuccess)
                    }
                    else
                    {
                        NSLog("%@",exception.reason!)
                        NSLog("%d",exception.httpErrorCode)  
                        NSLog("%d",exception.appErrorCode)  
                        NSLog("%@",exception.userInfo!)  
                    }  
                })
          }
        
        func deleteAllAvatars()
        {
            let userName = "Nick"
            //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
            //let avatarService = App42API.buildAvatarService() as? AvatarService
            avatarService?.deleteAllAvatars(userName, completionBlock:{ (success, response, exception) -> Void in
                    if(success)
                    {
                        let response = response as! App42Response
                        NSLog("%@", response.strResponse)
                        NSLog("%@", response.isResponseSuccess)
                    }
                    else
                    {
                        NSLog("%@",exception.reason!)
                        NSLog("%d",exception.httpErrorCode)  
                        NSLog("%d",exception.appErrorCode)  
                        NSLog("%@",exception.userInfo!)  
                    }  
                })
        }*/
}
