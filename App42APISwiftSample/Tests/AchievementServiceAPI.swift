//
//  AchievementServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 10/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class AchievementServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let achievementService = App42API.buildAchievementService() as? AchievementService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Acheivement Service"
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
        if cellText == "CreateAchievementWithName"
        {
            createAchievement()
        }
        else if cellText == "EarnAchievementWithName"
        {
            earnAchievementWithName()
        }
        else if cellText == "GetAllAchievementsForUser"
        {
            getAllAchievementsForUser()
        }
        else if cellText == "GetAllAchievementsForUserInAGame"
        {
            getAllAchievementsForUserInAGame()
        }
        else if cellText == "GetAllAchievements"
        {
            getAllAchievements()
        }
        else if cellText == "GetAchievementByName"
        {
            getAchievementByName()
        }
        else if cellText == "GetAllUsersWithAchievement"
        {
            getAllUsersWithAchievement()
        }
    }
    
    func createAchievement()
    {
        let achievementName = "Expert"
        let description = "Expert achievement"
        achievementService?.createAchievementWithName(achievementName, description: description, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let achievement = response as! Achievement
                NSLog("Response is %@" , achievement.strResponse);
                NSLog("isResponseSuccess is %d" , achievement.isResponseSuccess);
                NSLog("name is %@" , achievement.name);
                NSLog("description is %@" , achievement.description);
                
            }
            else
            {
                NSLog("Exception = %@", exception.reason!)
                NSLog("App Error Code = %d", exception.appErrorCode)
                NSLog("HTTP error Code = %d", exception.httpErrorCode)
                NSLog("User Info = %@", exception.userInfo!)
            }
        })
    }
    
    func earnAchievementWithName()
    {
        let achievementName = "Expert"
        let userName = "Nick"
        let gameName = "NinjaFight"
        let description = "Expert achievement"
        achievementService?.earnAchievementWithName(achievementName, userName: userName, gameName: gameName, description: description, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let achievement = response as! Achievement
                NSLog("Response is %@" , achievement.strResponse);
                NSLog("isResponseSuccess is %d" , achievement.isResponseSuccess);
                NSLog("User Name is %@" , achievement.userName);
                NSLog("name is %@" , achievement.name);
                NSLog("description is %@" , achievement.description);
                NSLog("achievedOn is %@" , achievement.achievedOn);

                
            }
            else
            {
                NSLog("Exception = %@", exception.reason!)
                NSLog("App Error Code = %d", exception.appErrorCode)
                NSLog("HTTP error Code = %d", exception.httpErrorCode)
                NSLog("User Info = %@", exception.userInfo!)
            }
        })
    }
    
    func getAllAchievementsForUser()
    {
        let userName = "Nick"
        
        achievementService?.getAllAchievementsForUser(userName, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let achievements = response as! NSArray
                for achievement in achievements{
                    NSLog("Response is %@" , achievement.strResponse);
                    NSLog("isResponseSuccess is %d" , achievement.isResponseSuccess);
                    NSLog("User Name is %@" , achievement.userName);
                    NSLog("name is %@" , achievement.name);
                    NSLog("description is %@" , achievement.description);
                    NSLog("achievedOn is %@" , achievement.achievedOn);
                }
            }
            else
            {
                NSLog("Exception = %@", exception.reason!)
                NSLog("App Error Code = %d", exception.appErrorCode)
                NSLog("HTTP error Code = %d", exception.httpErrorCode)
                NSLog("User Info = %@", exception.userInfo!)
            }
        })
    }
    
    func getAllAchievementsForUserInAGame()
    {
        let userName = "Nick"
        let gameName = "NinjaFight"
        achievementService?.getAllAchievementsForUser(userName, inGame: gameName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let achievements = response as! NSArray
                for achievement in achievements{
                    NSLog("Response is %@" , achievement.strResponse);
                    NSLog("isResponseSuccess is %d" , achievement.isResponseSuccess);
                    NSLog("User Name is %@" , achievement.userName);
                    NSLog("Game Name is %@" , achievement.gameName);
                    NSLog("name is %@" , achievement.name);
                    NSLog("description is %@" , achievement.description);
                    NSLog("achievedOn is %@" , achievement.achievedOn);
                }
            }
            else
            {
                NSLog("Exception = %@", exception.reason!)
                NSLog("App Error Code = %d", exception.appErrorCode)
                NSLog("HTTP error Code = %d", exception.httpErrorCode)
                NSLog("User Info = %@", exception.userInfo!)
            }
        })
    }
    
    func getAllAchievements()
    {
        achievementService?.getAllAchievements({ (success, response, exception) -> Void in
            if(success)
            {
                let achievements = response as! NSArray
                for achievement in achievements{
                    NSLog("Response is %@" , achievement.strResponse);
                    NSLog("isResponseSuccess is %d" , achievement.isResponseSuccess);
                    NSLog("name is %@" , achievement.name);
                    NSLog("description is %@" , achievement.description);
                }
            }
            else
            {
                NSLog("Exception = %@", exception.reason!)
                NSLog("App Error Code = %d", exception.appErrorCode)
                NSLog("HTTP error Code = %d", exception.httpErrorCode)
                NSLog("User Info = %@", exception.userInfo!)
            }
        })
    }
    
    func getAchievementByName()
    {
        let achievementName = "Expert"
        achievementService?.getAchievementByName(achievementName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let achievement = response as! Achievement
                NSLog("Response is %@" , achievement.strResponse);
                NSLog("isResponseSuccess is %d" , achievement.isResponseSuccess);
                NSLog("name is %@" , achievement.name);
                NSLog("description is %@" , achievement.description);
            }
            else
            {
                NSLog("Exception = %@", exception.reason!)
                NSLog("App Error Code = %d", exception.appErrorCode)
                NSLog("HTTP error Code = %d", exception.httpErrorCode)
                NSLog("User Info = %@", exception.userInfo!)
            }
        })
    }
    
    func getAllUsersWithAchievement()
    {
        let achievementName = "Expert"
        let gameName = "NinjaFight"
        achievementService?.getAllUsersWithAchievement(achievementName, inGame: gameName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let achievements = response as! NSArray
                for achievement in achievements{
                    NSLog("Response is %@" , achievement.strResponse);
                    NSLog("isResponseSuccess is %d" , achievement.isResponseSuccess);
                    NSLog("name is %@" , achievement.name);
                    NSLog("User Name = %@", achievement.userName)
                    NSLog("description is %@" , achievement.description);
                }
            }
            else
            {
                NSLog("Exception = %@", exception.reason!)
                NSLog("App Error Code = %d", exception.appErrorCode)
                NSLog("HTTP error Code = %d", exception.httpErrorCode)
                NSLog("User Info = %@", exception.userInfo!)
            }
        })
    }
}
