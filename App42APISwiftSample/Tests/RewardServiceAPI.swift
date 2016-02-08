//
//  RewardServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class RewardServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var rewardService:RewardService? = nil
    var sessionId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Reward Service"
        rewardService = App42API.buildRewardService() as? RewardService
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
        if cellText == "CreateReward"
        {
            CreateReward()
        }
        else if cellText == "GetAllRewardsCount"
        {
            GetAllRewardsCount()
        }
        else if cellText == "GetAllRewards"
        {
            GetAllRewards()
        }
        else if cellText == "GetAllRewardsByPaging"
        {
            GetAllRewardsByPaging()
        }
        else if cellText == "GetRewardByName"
        {
            GetRewardByName()
        }
        else if cellText == "EarnRewards"
        {
            EarnRewards()
        }
        else if cellText == "RedeemRewards"
        {
            RedeemRewards()
        }
        else if cellText == "GetGameRewardPointsForUser"
        {
            GetGameRewardPointsForUser()
        }
        else if cellText == "GetTopNRewardEarners"
        {
            GetTopNRewardEarners()
        }
        else if cellText == "GetAllRewardsByUser"
        {
            GetAllRewardsByUser()
        }
        else if cellText == "GetTopNRewardEarnersByGroup"
        {
            GetTopNRewardEarnersByGroup()
        }
        else if cellText == "GetUserRankingOnReward"
        {
            GetUserRankingOnReward()
        }
    }
    
    func CreateReward()
    {
        NSLog("createReward")
        let rewardName = "test"
        let description = "testing"
        rewardService?.createReward(rewardName, rewardDescription: description, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! Reward
                NSLog("%@", reward.name)
                NSLog("%@", reward.description)
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
    func GetRewardByName()
    {
        NSLog("GetRewardByName")
        let rewardName = "test"
        rewardService?.getRewardByName(rewardName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! Reward
                NSLog("%@", reward.name)
                NSLog("%@", reward.description)
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
    func GetAllRewards()
    {
        NSLog("GetAllRewards")
        rewardService?.getAllRewards( { (success, response, exception) -> Void in
            if(success)
            {
                let list = response as! NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%@", reward.description)
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
    func GetAllRewardsByPaging()
    {
        NSLog("GetAllRewardsByPaging")
        let max:Int32 = 11
        let offset:Int32 = 0
        rewardService?.getAllRewards(max, offset: offset, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let list = response as! NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%@", reward.description)
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
    func GetAllRewardsCount()
    {
        NSLog("GetAllRewardsCount")
        rewardService?.getAllRewardsCount( { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! App42Response
                NSLog("%@", reward.strResponse)
                NSLog("%d", reward.totalRecords)
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
    func EarnRewards()
    {
        NSLog("Create User")
        let rewardName = "test"
        let userName = "bhavika"
        let gameName = "angrybirds"
        let rewardPoint:Double = 1000
        rewardService?.earnRewards(gameName, gameUserName:userName,rewardName:rewardName, rewardPoints:rewardPoint, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
        rewardService?.earnRewards(gameName, gameUserName:"Rajeev",rewardName:rewardName, rewardPoints:500, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
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
    func RedeemRewards()
    {
        NSLog("Create User")
        let rewardName = "test"
        let userName = "bhavika"
        let gameName = "angrybirds"
        let rewardPoint:Double = 2000
        rewardService?.redeemRewards(gameName, gameUserName:userName,rewardName:rewardName, rewardPoints:rewardPoint, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
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
    func GetGameRewardPointsForUser()
    {
        NSLog("getGameRewardPointsForUser")
        let userName = "bhavika"
        let gameName = "angrybirds"
        rewardService?.getGameRewardPointsForUser(gameName, userName: userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! Reward
                   NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
                
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
    func GetTopNRewardEarners()
    {
        NSLog("getTopNRewardEarners")
        let rewardName = "test"
        let gameName = "angrybirds"
        rewardService?.getTopNRewardEarners(gameName, rewardName: rewardName, max:10, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let list = response as! NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
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
    func GetAllRewardsByUser()
    {
        NSLog("GetAllRewardsByUser")
        let rewardName = "test"
        let userName = "bhavika"
        rewardService?.getAllRewardsByUser(userName, rewardName: rewardName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let list = response as! NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
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
    func GetTopNRewardEarnersByGroup()
    {
        NSLog("GetTopNRewardEarnersByGroup")
        let rewardName = "test"
        let gameName = "angrybirds"
        let userList = ["Bhavika","Rajeev"]
        rewardService?.getTopNRewardEarnersByGroup(gameName, rewardName: rewardName, userList:userList, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let list = response as! NSArray
                for reward in list {
                    NSLog("%@", reward.name)
                    NSLog("%f", reward.points)
                    NSLog("%@", reward.userName)
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
    func GetUserRankingOnReward()
    {
        NSLog("getTopNRewardEarners")
        let rewardName = "DeemedPoints"
        let gameName = "MorzillaTale"
        let userName = "Himanshu"
        rewardService?.getUserRankingOnReward(gameName, rewardName: rewardName, userName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let reward = response as! Reward
                NSLog("%@", reward.name)
                NSLog("%f", reward.points)
                NSLog("%@", reward.userName)
                NSLog("%f", reward.rank)
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