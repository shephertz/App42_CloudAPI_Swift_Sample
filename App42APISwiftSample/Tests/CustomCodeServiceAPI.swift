//
//  CustomCodeServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 29/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class CustomCodeServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let customCodeService = App42API.buildCustomCodeService() as? CustomCodeService
    var sessionId:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Custom Code Service"
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
        if cellText == "RunJavaCode"
        {
           runJavaCode()
        }
        
        
    }
    func runJavaCode()
    {
        
        let name = "friendListFetch"
        let requestBody = NSMutableDictionary()
        requestBody["AccessToken"] = "CAACEdEose0cBABxqZAWgZB1iZCoGPG8N4x2OfKh7gYhWs6k4tVINJr6sfwxemqwqEQmX4meZBWFrouZBO1gAZCUgBY9B51TUUZB3Xmb3sJUPx9zG2ZBgf2EgC9vRgMvNb9Vw4OCY1Up4e8VZBtjqIE5mK2ILZC3ef1MHa6ZBBV8euzxxZAE9eLVPMMeRt9vIRYT6XQ9hLFZCqUphdLgchKMmWwcrU"
        requestBody["max"] = 10
        requestBody["offset"] = 0
        requestBody["height"] = 500
        requestBody["width"] = 500
        customCodeService?.runJavaCode(name, requestBody: requestBody as [NSObject : AnyObject], completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let responseString = response as! NSString
                NSLog("Success Response  is %@", responseString)
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
