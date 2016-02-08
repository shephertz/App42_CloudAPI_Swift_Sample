//
//  GameServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 02/06/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class GameServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var gameService:GameService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Game Service"
        gameService = App42API.buildGameService() as? GameService
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
        if cellText == "CreateGame"
        {
            createGame()
        }
        else if cellText == "GetAllGamesCount"
        {
            getAllGamesCount()
        }
        else if cellText == "GetAllGames"
        {
            getAllGames()
        }
        else if cellText == "GetAllGamesByPaging"
        {
            getAllGamesByPaging()
        }
        else if cellText == "GetGameByName"
        {
            getGameByName()
        }
    }
    
    func createGame()
    {
        let gameName = "AngryBirds"
        let description = "ANgry Birds"
        gameService?.createGame(gameName, gameDescription: description, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("Game Name = %@", game.name)
                NSLog("Description = %@", game.description)
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
    
    func getAllGamesCount()
    {
        
        gameService?.getAllGamesCount({ (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response = %@", app42Response.strResponse)
                NSLog("Total Games count = %d", app42Response.totalRecords)
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
    
    func getAllGames()
    {
        gameService?.getAllGames({ (success, response, exception) -> Void in
            if(success)
            {
                let games = response as! NSArray
                
                for game in games
                {
                    NSLog("Game Name = %@", game.name)
                    NSLog("Description = %@", game.description)
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
    
    func getAllGamesByPaging()
    {
        let max:Int32 = 5
        let offset:Int32 = 0
        
        gameService?.getAllGames(max, offset: offset, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let games = response as! NSArray
                
                for game in games{
                    NSLog("Game Name = %@", game.name)
                    NSLog("Description = %@", game.description)
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
    
    func getGameByName()
    {
        let gameName = "AngryBirds";
        gameService?.getGameByName(gameName, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let game = response as! Game
                NSLog("Game Name = %@", game.name)
                NSLog("Description = %@", game.description)
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
