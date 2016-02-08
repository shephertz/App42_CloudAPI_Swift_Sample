//
//  RecommenderServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 30/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class RecommenderServiceAPI: UITableViewController {
    var apiList:NSArray? = nil
    let recommenderService = App42API.buildRecommenderService() as? RecommenderService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Recommender Service"
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
        if cellText == "LoadPreferenceFile"
        {
            loadPreferenceFile()
        }
        else if cellText == "GetFriendRequest"
        {
            //getFriendRequestFromUser()
        }
       
    }
   
 func loadPreferenceFile()
    {
        let filePath = NSBundle.mainBundle().pathForResource("Image", ofType: "png")
       // App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
       // let recommenderService = App42API.buildRecommenderService() as? RecommenderService
        recommenderService?.loadPreferenceFile(filePath,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let app42Response = response as! App42Response
            NSLog("Response success is : %d", app42Response.isResponseSuccess)
            NSLog("Response String is %@", app42Response.strResponse)
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
