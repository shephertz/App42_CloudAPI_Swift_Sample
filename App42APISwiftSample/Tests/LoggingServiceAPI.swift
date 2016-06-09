//
//  LoggingServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 28/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class LoggingServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let logService = App42API.buildLogService() as? LogService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Logging Service"
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
        if cellText == "Info"
        {
            info()
        }
        else if cellText == "Debug"
        {
            debug()
        }
        else if cellText == "Error"
        {
            error()
        }
        else if cellText == "Fatal"
        {
            fatal()
        }
        else if cellText == "FetchLogsCountByModule"
        {
            fetchLogsCountByModule()
        }
        else if cellText == "FetchLogsByModule"
        {
            fetchLogsByModule()
        }
        else if cellText == "FetchLogsByModuleAndText"
        {
            fetchLogsByModuleAndText()
        }
        else if cellText == "FetchLogsCountByModuleAndText"
        {
            fetchLogsCountByModuleAndText()
        }
        else if cellText == "FetchLogsByInfo"
        {
            fetchLogsByInfo()
        }
        else if cellText == "FetchLogsByInfoByPaging"
        {
            fetchLogsByInfoByPaging()
        }
        else if cellText == "FetchLogsByModuleAndTextByPaging"
        {
            fetchLogsByModuleAndTextByPaging()
        }
        else if cellText == "FetchLogsByDebug"
        {
            fetchLogsByDebug()
        }
        else if cellText == "FetchLogsCountByDebug"
        {
            fetchLogsCountByDebug()
        }
        else if cellText == "FetchLogsByDebugByPaging"
        {
            fetchLogsByDebugByPaging()
        }
        else if cellText == "FetchLogsByError"
        {
            fetchLogsByError()
        }
        else if cellText == "FetchLogsCountByError"
        {
            fetchLogsCountByError()
        }
        else if cellText == "FetchLogsByErrorByPaging"
        {
            fetchLogsByErrorByPaging()
        }
        else if cellText == "FetchLogsByFatal"
        {
            fetchLogsByFatal()
        }
        else if cellText == "FetchLogsCountByFatal"
        {
            fetchLogsCountByFatal()
        }
        else if cellText == "FetchLogsByFatalByPaging"
        {
            fetchLogsByFatalByPaging()
        }

        else if cellText == "FetchLogByDateRange"
        {
            fetchLogByDateRange()
        }
        else if cellText == "FetchLogCountByDateRange"
        {
            fetchLogCountByDateRange()
        }
        else if cellText == "FetchLogCountByDateRangeByPaging"
        {
            fetchLogCountByDateRangeByPaging()
        }
        else if cellText == "SetEventWithName"
        {
             setEventWithName()
        }
        else if cellText == "SetEventWithNameForModule"
        {
             setEventWithNameForModule()
        }
        
       
        
    }
    
    func info()
    {
        let message = "Hello....."
        let moduleName = "test"
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.info(message, module:moduleName, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let log = response as! Log
                NSLog("Response is %@" , log.strResponse);
                for message in log.logMessageArray
                {
                    NSLog("module is =%@",message.module);
                    NSLog("logTime is  = %@",message.logTime);
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
    
    func debug()
    {
        let message = "Hi.."
        let moduleName = "test"
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.debug(message, module:moduleName,  completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let log = response as! Log
                NSLog("Response is %@" , log.strResponse);
                for message in log.logMessageArray
                {
                    NSLog("module is =%@",message.module);
                    NSLog("logTime is  = %@",message.logTime);
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
    
        func error()
        {
            let message = "hi"
            let moduleName = "test"
            //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
            //let logService = App42API.buildLogService() as? logService
            logService?.error(message, module:moduleName, completionBlock: { (success, response, exception) -> Void in
                if (success)
                {
                    let log = response as! Log
                    NSLog("Response is %@" , log.strResponse);
                    for message in log.logMessageArray
                    {
                        NSLog("module is =%@",message.module);
                        NSLog("logTime is  = %@",message.logTime);
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
        
    func fatal()
    {
        let message = "hi.."
        let moduleName = "test"
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? logService
        logService?.fatal(message, module:moduleName, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let log = response as! Log
                NSLog("Response is %@" ,log.strResponse);
                for message in log.logMessageArray
                {
                    NSLog("module is =%@",message.module);
                    NSLog("logTime is  = %@",message.logTime);
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
        
        func fetchLogsByModule()
        {
            let moduleName = "test"
            //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
            //let logService = App42API.buildLogService() as? LogService
            logService?.fetchLogsByModule(moduleName, completionBlock: { (success, response, exception) -> Void in
                if (success)
                {
                    let log = response as! Log
                    NSLog("Response is %@" , log.strResponse);
                    for message in log.logMessageArray
                    {
                        NSLog("module is =%@",message.module);
                        NSLog("logTime is  = %@",message.logTime);
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
        
        func fetchLogsCountByModule()
        {
            let moduleName = "test"
            //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
            //let logService = App42API.buildLogService() as? LogService
            logService?.fetchLogsCountByModule(moduleName, completionBlock: { (success, response, exception) -> Void in
                if (success)
                {
                    let  log = response as! App42Response
                    NSLog("%@", log.strResponse)
                    NSLog("%d", log.totalRecords)
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
    func fetchLogsByModuleAndText()
    {
        let moduleName = "test"
        let text = "heyy"
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByModuleAndText(moduleName, text:text, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let log = response as! Log
            NSLog("Response is %@" , log.strResponse);
            for message in log.logMessageArray
            {
                NSLog("module is =%@",message.module);
                NSLog("logTime is  = %@",message.logTime);
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
    func fetchLogsCountByModuleAndText()
    {
        let moduleName = "moduleName"
        let text = "text"
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsCountByModuleAndText(moduleName, text:text, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            NSLog("%d", log.totalRecords)
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
    
    func fetchLogsByModuleAndTextByPaging()
    {
        let moduleName = "moduleName"
        let text = "text"
        let max:Int32 = 1
        let offset:Int32 = 0
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByModuleAndText(moduleName, text:text, max:max, offset:offset, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
         let  log = response as! Log
         NSLog("%@", log.strResponse)
         for message in log.logMessageArray
            {
             NSLog("module is =%@",message.module);
             NSLog("logTime is  = %@",message.logTime);
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
    
    func fetchLogsByInfo()
    {
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByInfo( { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            for message in log.logMessageArray
            {
                NSLog("module is =%@",message.module);
                NSLog("logTime is  = %@",message.logTime);
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
    
    func fetchLogsByInfoByPaging()
    {
        let max:Int32 = 1
        let offset:Int32 = 0
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByInfo(max, offset:offset, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let  log = response as! Log
        NSLog("%@", log.strResponse)
        for message in log.logMessageArray
        {
        NSLog("module is =%@",message.module);
        NSLog("logTime is  = %@",message.logTime);
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
    func fetchLogsByDebug()
    {
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByDebug( { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            for message in log.logMessageArray
            {
                NSLog("module is =%@",message.module);
                NSLog("logTime is  = %@",message.logTime);
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
    func fetchLogsCountByDebug()
    {
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsCountByDebug( { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            NSLog("%d", log.totalRecords)
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
    
    func fetchLogsByDebugByPaging()
    {
        let max:Int32 = 1
        let offset:Int32 = 0
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByDebug(max, offset:offset, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            for message in log.logMessageArray
            {
            NSLog("module is =%@",message.module);
            NSLog("logTime is  = %@",message.logTime);
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
    
    func fetchLogsByError()
    {
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByError( { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            for message in log.logMessageArray
            {
            NSLog("module is =%@",message.module);
            NSLog("logTime is  = %@",message.logTime);
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
    
    func fetchLogsCountByError()
    {
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsCountByError( { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            NSLog("%d", log.totalRecords)
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
    
    func fetchLogsByErrorByPaging()
    {
        let max:Int32 = 1
        let offset:Int32 = 0
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByError(max, offset:offset, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            for message in log.logMessageArray
            {
            NSLog("module is =%@",message.module);
            NSLog("logTime is  = %@",message.logTime);
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
    
    func fetchLogsByFatal()
    {
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByFatal( { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            for message in log.logMessageArray
            {
            NSLog("module is =%@",message.module);
            NSLog("logTime is  = %@",message.logTime);
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
    
    func fetchLogsCountByFatal()
    {
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsCountByFatal( { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            NSLog("%d", log.totalRecords)
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
    func fetchLogsByFatalByPaging()
    {
        let max:Int32 = 1
        let offset:Int32 = 0
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogsByFatal(max, offset:offset, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let  log = response as! Log
                NSLog("%@", log.strResponse)
                for message in log.logMessageArray
                {
                    NSLog("module is =%@",message.module);
                    NSLog("logTime is  = %@",message.logTime);
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
    
    func fetchLogByDateRange()
    {
        let startDate = NSDate(timeIntervalSinceNow: -24*60*60)  //change this as required
        let endDate = NSDate()
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogByDateRange(startDate, endDate:endDate, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            NSLog("%d", log.totalRecords)
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
    func fetchLogCountByDateRange()
    {
        let startDate = NSDate(timeIntervalSinceNow: -24*60*60)  //change this as required
        let endDate = NSDate()
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogCountByDateRange(startDate, endDate:endDate, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            NSLog("%d", log.totalRecords)
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
    
    func fetchLogCountByDateRangeByPaging()
    {
        let max:Int32 = 1;
        let offset:Int32 = 0;
        let startDate = NSDate(timeIntervalSinceNow: -24*60*60)  //change this as required
        let endDate = NSDate()
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let logService = App42API.buildLogService() as? LogService
        logService?.fetchLogByDateRange(startDate, endDate:endDate, max:max, offset:offset, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let  log = response as! Log
                NSLog("%@", log.strResponse)
                for message in log.logMessageArray
                {
                    NSLog("module is =%@",message.module);
                    NSLog("logTime is  = %@",message.logTime);
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
    
    func setEventWithName()
    {
        let eventName = "e1"
        //App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.setEventWithName(eventName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let  log = response as! Log
        NSLog("%@", log.strResponse)
        for message in log.logMessageArray
        {
            NSLog("event is =%@",message.module)
            NSLog("logTime is  = %@",message.logTime)
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
    func setEventWithNameForModule()
    {
        let eventName = "e1"
        let moduleName = "test"
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
        //let logService = App42API.buildLogService() as? LogService
        logService?.setEventWithName(eventName, forModule:moduleName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  log = response as! Log
            NSLog("%@", log.strResponse)
            for message in log.logMessageArray
            {
            NSLog("module is =%@",message.module);
            NSLog("logTime is  = %@",message.logTime);
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
    
    }



