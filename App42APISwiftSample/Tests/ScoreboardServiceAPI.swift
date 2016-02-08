//
//  ScoreboardServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class ScoreboardServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var scoreBoardService:ScoreBoardService? = nil
    var editScoreId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Scoreboard Service"
        scoreBoardService = App42API.buildScoreBoardService() as? ScoreBoardService
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
        if cellText == "SaveUserScore"
        {
            SaveUserScore()
        }
        else if cellText == "GetScoresByUser"
        {
            GetScoresByUser()
        }
        else if cellText == "GetHighestScoreByUser"
        {
            GetHighestScoreByUser()
        }
        else if cellText == "GetLowestScoreByUser"
        {
            GetLowestScoreByUser()
        }
        else if cellText == "GetAverageScoreByUser"
        {
            GetAverageScoreByUser()
        }
        else if cellText == "GetTopRankings"
        {
            GetTopRankings()
        }
        else if cellText == "GetTopNRankings"
        {
            GetTopRankings()
        }

        else if cellText == "GetTopRankersByGroup"
        {
            GetTopRankersByGroup()
        }
        else if cellText == "GetTopRankingsByGroup"
        {
            GetTopRankingsByGroup()
        }
        else if cellText == "GetTopRankingsInDateRange"
        {
            GetTopRankingsInDateRange()
        }
        else if cellText == "GetTopNRankersInDateRange"
        {
            GetTopNRankersInDateRange()
        }
        else if cellText == "GetLastGameScore"
        {
           GetLastGameScore()
        }
        else if cellText == "GetUserRanking"
        {
          GetUserRanking()
        }
        else if cellText == "GetLastScoreByUser"
        {
            GetLastScoreByUser()
        }
        else if cellText == "EditScoreValueById"
        {
            EditScoreValueById()
        }
        else if cellText == "GetTopRankersFromBuddyGroup"
        {
            GetTopRankersFromBuddyGroup()
        }
        else if cellText == "GetTopNRankersFromFacebook"
        {
            GetTopNRankersFromFacebook()
        }
        else if cellText == "GetTopNRankersFromFacebookInDateRange"
        {
            GetTopNRankersFromFacebookInDateRange()
        }
        else if cellText == "GetTopNTargetRankers"
        {
            GetTopNTargetRankers()
        }
        else if cellText == "GetUsersWithScoreRange"
        {
            GetUsersWithScoreRange()
        }
        else if cellText == "GetTopNRankers"
        {
            GetTopNRankers()
        }
    }
    
    func SaveUserScore()
    {
        let gameName = "NinjaFight"
        let userName = "123456"
        let score:Double = 2000
        scoreBoardService?.saveUserScore(gameName,gameUserName:userName,gameScore:score, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("GameName is %@", game.name)
                let scoreList = game.scoreList
                for score in scoreList
                {
                    NSLog("userName is %@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("Score is %lf",scoreValue)
                    NSLog("ScoreId is%@", score.scoreId)
                    //self.editScoreId = score.scoreId
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
    func GetScoresByUser()
    {
        let gameName = "NinjaFight"
        let userName = "123456"
        scoreBoardService?.getScoresByUser(gameName,gameUserName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("Game Name is %@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("Username is %@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("Score is %lf",scoreValue)
                    NSLog("Score Id is%@", score.scoreId)
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
   
    func GetHighestScoreByUser()
    {
        let gameName  = "NinjaFight"
        let userName = "123456"
        scoreBoardService?.getHighestScoreByUser(gameName,gameUserName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
    
    func GetLowestScoreByUser()
    {
        let gameName  = "NinjaFight"
        let userName = "123456"
        scoreBoardService?.getLowestScoreByUser(gameName,gameUserName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
    
    func GetAverageScoreByUser()
    {
        let gameName  = "NinjaFight"
        let userName = "123456"
        scoreBoardService?.getAverageScoreByUser(gameName,userName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
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
    
    func GetTopRankings()
    {
        let gameName  = "NinjaFight"
        scoreBoardService?.getTopRankings(gameName,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
    
    func GetTopNRankings()
    {
        let gameName  = "NinjaFight"
        let max:Int32 = 5
        scoreBoardService?.getTopNRankings(gameName, max:max, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList
                {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
    
    func GetTopRankersByGroup()
    {
        let gameName  = "NinjaFight"
        let userList = ["Himanshu","Nick","123456"]
        scoreBoardService?.getTopRankersByGroup(gameName,group:userList,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
    
    func GetTopRankingsByGroup()
    {
        let gameName  = "NinjaFight"
        let userList = ["Himanshu","Nick","123456"]
        scoreBoardService?.getTopRankingsByGroup(gameName,group:userList,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetTopRankingsInDateRange()
    {
        let gameName  = "NinjaFight"
        let startDate = NSDate().laterDate(NSDate())
        let endDate = NSDate()
        scoreBoardService?.getTopRankings(gameName,startDate:startDate,endDate:endDate,completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetTopNRankersInDateRange()
    {
        let gameName  = "NinjaFight"
        let startDate = NSDate(timeIntervalSinceNow: -24*60*60*2)
        let endDate = NSDate(timeIntervalSinceNow: -24*60*60)//NSDate()
        let max:Int32 = 10
        
        scoreBoardService?.getTopNRankers(gameName,startDate:startDate,endDate:endDate,max:max, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetLastGameScore()
    {
        let userName = "Nick"
        scoreBoardService?.getLastGameScore(userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetUserRanking()
    {
        let gameName  = "NinjaFight"
        let userName = "123456"
        scoreBoardService?.getUserRanking(gameName,userName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetLastScoreByUser()
    {
        let gameName  = "NinjaFight"
        let userName = "123456"
        scoreBoardService?.getLastScoreByUser(gameName,userName:userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func EditScoreValueById()
    {//First run saveScore to get scoreId or assign a valid scoreId to following variable
        let scoreId = "Buh5BqZqgszsogi2cSINXJsTIEM="      //:String = editScoreId as! String
        let score:Double = 9000
         scoreBoardService?.editScoreValueById(scoreId, gameScore:score, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    NSLog("%@", score.scoreId)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
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
   
    func GetTopRankersFromBuddyGroup()
    {
        let gameName  = "NinjaFight"
        let userName = "Nick"
        let ownerName = "Nick"
        let groupName = "Group Name"
        scoreBoardService?.getTopRankersFromBuddyGroup(gameName,userName:userName,ownerName:ownerName,groupName:groupName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetTopNRankersFromFacebook()
    {
        let gameName  = "NinjaFight"
        let accessToken = ""
        let max:Int32 = 10
        scoreBoardService?.getTopNRankersFromFacebook(gameName,fbAccessToken:accessToken,max:max, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetTopNRankersFromFacebookInDateRange()
    {
        let gameName  = "NinjaFight"
        let accessToken = ""
        let max:Int32 = 10
        let startDate = NSDate().laterDate(NSDate())
        let endDate = NSDate()
        scoreBoardService?.getTopNRankersFromFacebook(gameName,fbAccessToken:accessToken,startDate:startDate,endDate:endDate,max:max, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetTopNTargetRankers()
    {
        let gameName  = "NinjaFight"
        let max:Int32 = 10
        scoreBoardService?.getTopNTargetRankers(gameName,max:max, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetUsersWithScoreRange()
    {
        let gameName  = "NinjaFight"
        let minScore:Double = 10
        let maxScore:Double = 5000
        scoreBoardService?.getUsersWithScoreRange(gameName,minScore:minScore,maxScore:maxScore, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    let scoreValue = score.value as Double
                    NSLog("%lf",scoreValue)
                    NSLog("%@", score.scoreId)
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
   
    func GetTopNRankers()
    {
        let gameName  = "NinjaFight"
        let max:Int32 = 10
        scoreBoardService?.getTopNRankers(gameName,max:max, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("%@", game.name)
                let scoreList = game.scoreList
                for score in scoreList {
                    NSLog("%@", score.userName)
                    NSLog("%@", score.scoreId)
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