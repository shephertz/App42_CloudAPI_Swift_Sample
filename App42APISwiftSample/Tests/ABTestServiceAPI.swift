//
//  ABTestServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 02/11/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class ABTestServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let abTestService = App42API.buildABTestService() as? ABTestService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ABTest Service"
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
        if cellText == "Execute"
        {
            execute()
        }
        else if cellText == "GoalAchievedForTest"
        {
            goalAchievedForTest()
        }
        else if cellText == "ExecuteDataDriven"
        {
            executeDataDriven()
        }
        else if cellText == "IsActive"
        {
            isActive()
        }
        

}
    
    func execute()
    {
        let testName = "Test1";
       // App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
       // let abTestService = App42API.buildABTestService as! ABTestService
        abTestService?.execute(testName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let abTest = response as! ABTest
            NSLog("Name =%@",abTest.name)
            var variantList:NSMutableArray = NSMutableArray()
            variantList = abTest.variantList
            for variant in variantList
            {
                NSLog("Name is = %@ " , variant.name)
            }
            NSLog("Type  is %@",abTest.type)
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
    
    func goalAchievedForTest()
    {
        let testName = "Test1"
        let variant = "Var1"
      //  App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
       // let abTestService = App42API.buildABTestService as! ABTestService
        abTestService?.goalAchievedForTest(testName, withVariant:variant, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let abTest = response as! ABTest
            NSLog("Name =%@",abTest.name);
            var variantList:NSMutableArray = NSMutableArray()
            variantList = abTest.variantList;
            for variant in variantList
            {
            NSLog("Name is = %@ " , variant.name)
           // NSLog("get profile list is = %@ " , variant.profile)
            }
            NSLog("Type  is %@",abTest.type);
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
    
    func executeDataDriven()
    {
        let testName = "AppTest42"
       // App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
       // let abTestService = App42API.buildABTestService as! ABTestService
        abTestService?.executeDataDriven(testName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let abTest = response as! ABTest
            NSLog("Name =%@",abTest.name)
            var variantList:NSMutableArray = NSMutableArray()
            variantList = abTest.variantList
            for variant in variantList
            {
                NSLog("Name is = %@ " , variant.name)
             //   NSLog("get profile list is = %@ " , variant.profile)
            }
            NSLog("Type  is %@",abTest.type)
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
    func isActive()
    {
        let testName = "Test1"
       // App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
      //  let abTestService = App42API.buildABTestService as! ABTestService
        abTestService?.isActive(testName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let isActive = response as! NSNumber
            NSLog("isActive  %@", isActive)
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


