//
//  ReviewServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 01/11/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class ReviewServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let reviewService = App42API.buildReviewService() as? ReviewService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Review Service"
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
        if cellText == "CreateReview"
        {
            createReview()
        }
        else if cellText == "GetAllReviews"
        {
            getAllReviews()
        }
        else if cellText == "GetAllReviewsCount"
        {
            getAllReviewsCount()
        }
        else if cellText == "GetAllReviewsByPaging"
        {
            getAllReviewsByPaging()
        }
        else if cellText == "GetAverageReviewByItem"
        {
            getAverageReviewByItem()
        }
        else if cellText == "GetReviewsCountByItem"
        {
            getReviewsCountByItem()
        }
        else if cellText == "GetReviewsByItemByPaging"
        {
            getReviewsByItemByPaging()
        }
        else if cellText == "GetHighestReviewByItem"
        {
            getHighestReviewByItem()
        }
         else if cellText == "GetLowestReviewByItem"
        {
            getLowestReviewByItem()
        }
       else if cellText == "GetAverageReviewByItemByPaging"
        {
            getAverageReviewByItemByPaging()
        }
       else if cellText == "GetReviewsCountByItemAndRating"
        {
            getReviewsCountByItemAndRating()
        }
        else if cellText == "AddComment"
        {
            addComment()
        }
        else if cellText == "GetCommentsByItem"
        {
            getCommentsByItem()
        }
        else if cellText == "DeleteReviewByReviewId"
        {
            deleteReviewByReviewId()
        }
        else if cellText == "Mute"
        {
            mute()
        }
        else if cellText == "Unmute"
        {
            unmute()
        }
        else if cellText == "DeleteCommentByCommentId"
        {
            deleteCommentByCommentId()
        }
        else if cellText == "GetAllReviewsByUser"
        {
            getAllReviewsByUser()
        }
     }

func createReview()
    {
        let userID = "Nick"
        let itemID = "1234"
        let reviewComment = "Its a review example"
        let reviewRating = 3.0
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.createReview(userID, itemID: itemID, reviewComment: reviewComment, reviewRating: reviewRating, completionBlock: { (success, response, exception) -> Void in
        if(success)
            {
                let review1 = response as! Review
                NSLog("userID is : %@", review1.userId)
                NSLog("itemID is : %@", review1.itemId)
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
    
    func getAllReviews()
    {
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getAllReviews( { (success, response, exception) -> Void in
        if(success)
        {
            let list = response as! NSArray
            for review in list
           {
            NSLog("%@", review.userId)
            NSLog("%@", review.itemId)
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
    
    func getAllReviewsCount()
    {
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getAllReviewsCount( { (success, response, exception) -> Void in
        if(success)
        {
            let review = response as! App42Response
            NSLog("%@", review.strResponse)
            NSLog("%d", review.totalRecords)
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

  func getAllReviewsByPaging()
    {
        let max:Int32 = 1
        let offset:Int32 = 0
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getAllReviews(max, offset:offset, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let list = response as! NSArray
            for review in list
            {
            NSLog("%@", review.userId)
            NSLog("%@", review.itemId)
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
    func getAverageReviewByItem()
    {
        let itemID = "1234";
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getAverageReviewByItem(itemID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let list = response as! NSArray
        for review in list
        {
        NSLog("%@", review.userId)
        NSLog("%@", review.itemId)
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
    
    func getReviewsCountByItem()
    {
    let  itemId = "1234"
   // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
   // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getAverageReviewByItem(itemId, completionBlock: { (success, response, exception) -> Void in
    if (success)
    {
        let  review = response as! App42Response
        NSLog("%@", review.strResponse)
        NSLog("%d", review.totalRecords)
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
   
    func getReviewsByItemByPaging()
    {
        let  itemID = "1234"
        let max:Int32 = 1
        let offset:Int32 = 0
      //  App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getReviewsByItem(itemID, max:max, offset:offset, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let list = response as! NSArray
            for review in list {
            NSLog("%@", review.userId)
            NSLog("%@", review.itemId)
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
    
    func getHighestReviewByItem()
    {
        let  itemID = "1234"
      //  App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
       reviewService?.getHighestReviewByItem(itemID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let review = response as! Review
            NSLog("%@", review.userId)
            NSLog("%@", review.itemId)
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

    func getLowestReviewByItem()
    {
        let  itemID = "1234"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
         reviewService?.getLowestReviewByItem(itemID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let review = response as! Review
            NSLog("%@", review.userId)
            NSLog("%@", review.itemId)
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
    
    func getAverageReviewByItemByPaging()
    {
        let  itemID = "1234"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getAverageReviewByItem(itemID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let review = response as! Review
            NSLog("%@", review.userId)
            NSLog("%@", review.itemId)
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
    
    func getReviewsCountByItemAndRating()
    {
        let  itemID = "1234"
        let rating = 4.00
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getReviewsCountByItem(itemID, andRating:rating, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  review = response as! App42Response
            NSLog("%@", review.strResponse)
            NSLog("%d", review.totalRecords)
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
    func addComment()
    {
        let userID = "Nick"
        let  itemID = "1234"
        let comment = "Hi..."
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.addComment(comment, byUser:userID, forItem:itemID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let review = response as! Review
        NSLog("%@", review.userId)
        NSLog("%@", review.itemId)
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
    
    func getCommentsByItem()
    {
        let  itemID = "1234"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let reviewService = App42API.buildReviewService() as? ReviewService
        
      reviewService?.getCommentsByItem(itemID, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let list = response as! NSArray
            for review in list
            {
                NSLog("%@", review.userId)
                NSLog("%@", review.itemId)
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
    
    func mute()
    {
        let reviewID = "9b5ae5c6-c577-4ec7-a8b1-f769dcbf7cee"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.mute(reviewID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let  review = response as! App42Response
            NSLog("%@", review.strResponse)
            NSLog("%d", review.totalRecords)
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
    
    func unmute()
    {
        let reviewID = "9b5ae5c6-c577-4ec7-a8b1-f769dcbf7cee"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.unmute(reviewID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let  review = response as! App42Response
        NSLog("%@", review.strResponse)
        NSLog("%d", review.totalRecords)
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
    func deleteReviewByReviewId()
    {
        let reviewId = "9b5ae5c6-c577-4ec7-a8b1-f769dcbf7cee";
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.deleteReviewByReviewId(reviewId, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let  review = response as! App42Response
        NSLog("%@", review.strResponse)
        NSLog("%d", review.totalRecords)
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
    
    func deleteCommentByCommentId()
    {
        let commentId = "commentId"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.deleteCommentByCommentId(commentId, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let  review = response as! App42Response
        NSLog("%@", review.strResponse)
        NSLog("%d", review.totalRecords)
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
    
    func getAllReviewsByUser()
    {
        let userID = "Nick"
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // let reviewService = App42API.buildReviewService() as? ReviewService
        reviewService?.getAllReviewsByUser(userID, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let list = response as! NSArray
        for review in list
        {
            NSLog("%@", review.userId)
            NSLog("%@", review.itemId)
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
