//
//  SessionServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 03/11/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class SessionServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let sessionService = App42API.buildSessionService() as? SessionService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Session Service"
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
        if cellText == "GetSession"
        {
           getSession()
        }
        else if cellText == "Getsessioncreate"
        {
           getsessioncreate()
        }
        else if cellText == "Invalidate"
        {
           invalidate()
        }
        else if cellText == "SetAttribute"
        {
            setAttribute()
        }
        else if cellText == "GetAttribute"
        {
            getAttribute()
        }
        else if cellText == "GetAllAttributes"
        {
            getAllAttributes()
        }
        else if cellText == "RemoveAttribute"
        {
            removeAttribute()
        }
        else if cellText == "RemoveAllAttributes"
        {
            removeAllAttributes()
        }
      
    }
    
    func getSession()
    {
        let userName = "Nick"
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
       // let sessionService :SessionService? = App42API.buildSessionService
        sessionService?.getSession(userName, completionBlock: { (success, response, exception) ->Void in
        if (success)
        {
            let session = response as! Session
            NSLog("%@",session.userName)
            NSLog("%@",session.sessionId)
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
    
    func getsessioncreate()
    {
        let userName = "Nick"
        let isCreate = true
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
       // let sessionService :SessionService? = App42API.buildSessionService
        sessionService?.getSession(userName, isCreate:isCreate, completionBlock: { (success, response, exception) ->Void in
        if (success)
        {
            let session = response as! Session
            NSLog("%@",session.userName)
            NSLog("%@",session.sessionId)
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
    
        func invalidate()
        {
            let sessionId  = "f96e6ace-86fc-4c7b-8ec6-bf106dff70a1"
           // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
           // let sessionService :SessionService? = App42API.buildSessionService
            sessionService?.invalidate(sessionId, completionBlock: { (success, response, exception) ->Void in
                if (success)
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

      
    func setAttribute()
        {
            let sessionId = "f96e6ace-86fc-4c7b-8ec6-bf106dff70a1"
            let attributeName  = "attributeName"
            let attributeValue  = "attributeValue"
           // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
            //let sessionService :SessionService? = App42API.buildSessionService
            sessionService?.setAttribute(sessionId, attributeName:attributeName, attributeValue:attributeValue, completionBlock: { (success, response, exception) ->Void in
            if (success)
            
            {
                let session = response as! Session
                NSLog("%@",session.sessionId)
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
    
    func getAttribute()
    {
        let sessionId = "f96e6ace-86fc-4c7b-8ec6-bf106dff70a1"
        let attributeName  = "attributeName"
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
       // let sessionService :SessionService? = App42API.buildSessionService
        sessionService?.getAttribute(sessionId, attributeName:attributeName, completionBlock: { (success, response, exception) ->Void in
        if (success)
        {
        let session = response as! Session
        NSLog("%@",session.sessionId)
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
    
    func getAllAttributes()
    {
        let sessionId  = "f96e6ace-86fc-4c7b-8ec6-bf106dff70a1"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let sessionService :SessionService? = App42API.buildSessionService
        sessionService?.getAllAttributes(sessionId, completionBlock: { (success, response, exception) ->Void in
        if (success)
        {
        let session = response as! Session
        NSLog("%@",session.userName)
        NSLog("%@",session.sessionId)
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
    
    func removeAttribute()
    {
        let sessionId = "sessionId"
        let attributeName = "attributeName"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let sessionService :SessionService? = App42API.buildSessionService
        sessionService?.removeAttribute(sessionId, attributeName:attributeName, completionBlock: { (success, response, exception) ->Void in
        if (success)
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
    
    func removeAllAttributes()
    {
        let sessionId = "sessionId"
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
       // let sessionService :SessionService? = App42API.buildSessionService
        sessionService?.removeAllAttributes(sessionId, completionBlock: { (success, response, exception) ->Void in
        if (success)
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
    
    
    
}
