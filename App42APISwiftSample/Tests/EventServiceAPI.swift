//
//  EventServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 29/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class EventServiceAPI: UITableViewController {
    var apiList:NSArray? = nil
    let eventService = App42API.buildEventService() as? EventService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Event Service"
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
        if cellText == "StartActivityWithName"
        {
            startActivityWithName()
        }
        else if cellText == "EndActivityWithName"
        {
            endActivityWithName()
        }
        else if cellText == "TrackEventWithName"
        {
            trackEventWithName()
        }
        else if cellText == "SetLoggedInUserProperties"
        {
            setLoggedInUserProperties()
        }
        else if cellText == "UpdateLoggedInUserProperties"
        {
           updateLoggedInUserProperties()
        }
    }
func startActivityWithName()
    {
        App42API.enableEventService(true)
        App42API.enableAppStateEventTracking(true)
        let activityName = "Level3"
        let properties = NSMutableDictionary(object:"Level3", forKey:"KEY1")
        //App42API.initializeWithAPIKey(@"API_KEY" andSecretKey:@"SECRET_KEY")
        //let eventService = App42API.buildEventService() as? EventService
        eventService?.startActivityWithName(activityName, andProperties: properties as [NSObject : AnyObject], completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let app42Response = response as! App42Response
            NSLog("App42Response is : %@", app42Response.strResponse)
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
func endActivityWithName()
    {
        let activityName = "Level3"
        let properties = NSMutableDictionary(object:"Level3", forKey:"KEY1")
        //App42API.initializeWithAPIKey(@"API_KEY" andSecretKey:@"SECRET_KEY")
        //let eventService = App42API.buildEventService() as? EventService
        eventService?.endActivityWithName(activityName, andProperties: properties as [NSObject : AnyObject], completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let app42Response = response as! App42Response
            NSLog("App42Response is : %@", app42Response.strResponse)
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
    
    func trackEventWithName()
    {
        let eventName = "LEVEL2"
        let properties = NSMutableDictionary(object:"Nick", forKey:"Name")
        //App42API.initializeWithAPIKey(@"API_KEY" andSecretKey:@"SECRET_KEY")
        //let eventService = App42API.buildEventService() as? EventService
        eventService?.trackEventWithName(eventName, andProperties: properties as [NSObject : AnyObject], completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
        let app42Response = response as! App42Response
        NSLog("App42Response is : %@", app42Response.strResponse)
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
    
  func setLoggedInUserProperties()
  {
        let properties = NSMutableDictionary(object:"Nick", forKey:"Name")
        //App42API.initializeWithAPIKey(@"API_KEY" andSecretKey:@"SECRET_KEY")
        //let eventService = App42API.buildEventService() as? EventService
        eventService?.setLoggedInUserProperties(properties as [NSObject : AnyObject], completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let app42Response = response as! App42Response
            NSLog("App42Response is : %@", app42Response.strResponse)
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
    
    func updateLoggedInUserProperties()
    {
        let properties = NSMutableDictionary(object:"John", forKey:"Name")
        //App42API.initializeWithAPIKey(@"API_KEY" andSecretKey:@"SECRET_KEY")
        //let eventService = App42API.buildEventService() as? EventService
        eventService?.updateLoggedInUserProperties(properties as [NSObject : AnyObject], completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let app42Response = response as! App42Response
            NSLog("App42Response is : %@", app42Response.strResponse)
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
