//
//  TimerServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 11/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class TimerServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let timerService = App42API.buildTimerService() as? TimerService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Timer Service"
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
        if cellText == "CreateOrUpdateTimerWithName"
        {
            createOrUpdateTimerWithName()
        }
        else if cellText == "StartTimerWithName"
        {
            startTimerWithName()
        }
        else if cellText == "IsTimerActive"
        {
            isTimerActive()
        }
        else if cellText == "CancelTimerWithName"
        {
            cancelTimerWithName()
        }
        else if cellText == "DeleteTimerWithName"
        {
            deleteTimerWithName()
        }
        else if cellText == "GetCurrentTime"
        {
            getCurrentTime()
        }
    }
    
    func createOrUpdateTimerWithName()
    {
        let timerName = "App42Watch"
        let timerInSeconds = 120
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let timerService = App42API.buildTimerService() as! TimerService()
        timerService?.createOrUpdateTimerWithName(timerName, timeInSeconds:timerInSeconds, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let timer = response as! Timer
                NSLog("TimerName = %@",timer.name)
                NSLog("TimeInSeconds = %ld",timer.timeInSeconds)
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
    
    func startTimerWithName()
    {
        let timerName = "App42Watch"//"<Enter_your_timer_name>"
        let userName = "John"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let timerService = App42API.buildTimerService() as! TimerService()
        timerService?.startTimerWithName(timerName, forUser:userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let timer = response as! Timer
                NSLog("TimerName = %@",timer.name);
                NSLog("CurrentTime = %@",timer.currentTime);
                NSLog("StartTime = %@",timer.startTime);
                NSLog("EndTime = %@",timer.endTime);
                NSLog("UserName = %@",timer.userName);
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
    
    func isTimerActive()
    {
        let timerName = "App42Watch"//"<Enter_your_timer_name>"
        let userName = "John"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let timerService = App42API.buildTimerService() as! TimerService()
        timerService?.isTimerActive(timerName, forUser:userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let timer = response as! Timer
                NSLog("TimerName = %@",timer.name);
                NSLog("IsTimerActive = %d",timer.isTimerActive);
                NSLog("User Name = %@",timer.userName);
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
    
    func cancelTimerWithName()
    {
        let timerName = "App42Watch"//"<Enter_your_timer_name>"
        let userName = "John"
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let timerService = App42API.buildTimerService() as! TimerService()
        timerService?.cancelTimerWithName(timerName, forUser:userName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let timer = response as! Timer
                NSLog("TimerName = %@",timer.name)
                NSLog("UserName = %@",timer.userName)
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
    
    func deleteTimerWithName()
    {
        let timerName = "App42Watch"//"<Enter_your_timer_name>"
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let timerService = App42API.buildTimerService() as! TimerService()
        timerService?.deleteTimerWithName(timerName, completionBlock:{ (success, response, exception) -> Void in
            if (success)
            {
                let app42Response = response as! App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%d", app42Response.totalRecords)
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
    
    func getCurrentTime()
    {
//        App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
//        let timerService = App42API.buildTimerService() as! TimerService()
        timerService?.getCurrentTime( { (success, response, exception) -> Void in
            if (success)
            {
                let timer = response as! Timer
                NSLog("CurrentTime = %@",timer.currentTime)
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
