//
//  SocialServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 30/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class SocialServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let socialService = App42API.buildSocialService() as? SocialService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Social Service"
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
        if cellText == "LinkUserFacebookAccount"
        {
            linkUserFacebookAccount()
        }
        else if cellText == "LinkUserFacebookAccountWithAppID"
        {
            linkUserFacebookAccountWithAppID()
        }
        else if cellText == "UpdateFacebookStatus"
        {
            updateFacebookStatus()
        }
        else if cellText == "GetFacebookFriendsFromLinkUser"
        {
            getFacebookFriendsFromLinkUser()
        }
        else if cellText == "GetFacebookFriendsFromAccessToken"
        {
            getFacebookFriendsFromAccessToken()
        }
        else if cellText == "LinkUserTwitterAccount"
        {
            linkUserTwitterAccount()
        }
        else if cellText == "LinkUserTwitterAccountWithConsumerKey"
        {
            linkUserTwitterAccountWithConsumerKey()
        }

        else if cellText == "LinkUserLinkedInAccount"
        {
            linkUserLinkedInAccount()
        }

        else if cellText == "UpdateTwitterStatus"
        {
            updateTwitterStatus()
        }

        else if cellText == "LinkUserLinkedInAccountApiKey"
        {
            linkUserLinkedInAccountApiKey()
        }
        else if cellText == "UpdateLinkedInStatus"
        {
            updateLinkedInStatus()
        }
        else if cellText == "UpdateSocialStatusForAll"
        {
            updateSocialStatusForAll()
        }
        else if cellText == "FacebookLinkPost"
        {
            facebookLinkPost()
        }
        else if cellText == "FacebookLinkPostWithCustomThumbnail"
        {
            facebookLinkPostWithCustomThumbnail()
        }
        else if cellText == "GetFacebookProfile"
        {
            getFacebookProfile()
        }
        else if cellText == "FacebookPublishStream"
        {
            facebookPublishStream()
        }

 }
    
   func linkUserFacebookAccount()
    {
        let  userName = "Nick"
        let  accessToken = "123"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.linkUserFacebookAccount(userName,accessToken:accessToken,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let social = response as! Social
            NSLog("userName is %@",social.userName)
            NSLog("FacebookAccessToken is %@",social.facebookAccessToken)
            NSLog("Response String is %@", social.strResponse)
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
    func linkUserFacebookAccountWithAppID()
    {
        let userName = "Nick"
        let accessToken = "123"
        let appId = "1553687891567482"
        let appSecret = "20947b1c19fc578190e813c4863adab6"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
       // let socialService = App42API.buildSocialService as! SocialService
        socialService?.linkUserFacebookAccount(userName, appId:appId, appSecret:appSecret, accessToken:accessToken,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let social = response as! Social
        NSLog("userName is %@",social.userName)
        NSLog("FacebookAccessToken is %@",social.facebookAccessToken)
        NSLog("Response String is %@", social.strResponse)
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
   
    func updateFacebookStatus()
    {
        let userName = "Nick"
        let status = "Nick is using the API"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.updateFacebookStatus(userName, status:status,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let social = response as! Social
        NSLog("userName is %@",social.userName)
        NSLog("status is %@",social.status)
        NSLog("Response String is %@", social.strResponse)
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
  
    func getFacebookFriendsFromLinkUser()
    {
        let  userName = "Nick"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.getFacebookFriendsFromLinkUser(userName,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let social = response as! Social
            NSLog("UserName = %@",social.userName);
            for friend in social.friendsList
            {
                NSLog("Name=%@",friend.name)
                NSLog("Picture=%@",friend.picture)
                NSLog("Id=%@",friend.friendId)
                NSLog("Installed=%d",friend.installed)
            }
        NSLog("Response String is %@", social.strResponse)
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
    func getFacebookFriendsFromAccessToken()
    {
        let accessToken = "CAAWFEibeY3oBADX1AGHJcLsYe3KNhc3DEOQxqMVZCR9QIEGUCqpUx4ZBLD7ZAfMp5xZBrMr0lZAt4uGcOE9hdwQTjVRZByfejTgSI2ziKQRfU45O3SteWlMZCfAp1UE2lrZCl4Rq8nONZAWEdbHLQqQqZBi9DrmZAcBNGAX2ZApfeiqBl2jaVrMERO1soxs6mITPZBG8JYcQ9RczQO9Y7z4fdwa9p"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
       // let socialService = App42API.buildSocialService as! SocialService
        socialService?.getFacebookFriendsFromAccessToken(accessToken,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let social = response as! Social
        for friend in social.friendsList
        {
        NSLog("Name=%@",friend.name)
        NSLog("Picture=%@",friend.picture)
        NSLog("Id=%@",friend.friendId)
        NSLog("Installed=%d",friend.installed)
        }
        NSLog("Response String is %@", social.strResponse)
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
    
    func linkUserTwitterAccount()
    {
        let  userName = "Nick"
        let  accessToken = "<Enter Twitter Access Token>"
        let  accessTokenSecret = "<Enter Twitter Access Token Secret>"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
       // let socialService = App42API.buildSocialService as! SocialService
        socialService?.linkUserTwitterAccount(userName, accessToken:accessToken, accessTokenSecret:accessTokenSecret, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let social = response as! Social
        NSLog("UserName = %@",social.userName)
        NSLog("twitterAccessToken is %@",social.twitterAccessToken)
        NSLog("Response String is %@", social.strResponse)
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
   
    func linkUserTwitterAccountWithConsumerKey()
    {
        let userName = "Nick"
        let accessToken = "<Enter Twitter Access Token>"
        let accessTokenSecret = "<Enter Twitter Access Token Secret>"
        let consumerKey = "<Enter Twitter Consumer Key>"
        let consumerSecret = "<Enter Twitter Consumer Secret>"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
       // let socialService = App42API.buildSocialService as! SocialService
        socialService?.linkUserTwitterAccount(userName, consumerKey:consumerKey, consumerSecret:consumerSecret, accessToken:accessToken, accessTokenSecret:accessTokenSecret, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let social = response as! Social
        NSLog("UserName = %@",social.userName)
        NSLog("twitterAccessToken is %@",social.twitterAccessToken)
        NSLog("Response String is %@", social.strResponse)
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
  func updateTwitterStatus()
    {
        let userName = "Nick";
        let status = "Nick is using the App42 API"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.updateTwitterStatus(userName, status:status, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let social = response as! Social
            NSLog("UserName = %@",social.userName)
            NSLog("status is %@",social.status)
            NSLog("Response String is %@", social.strResponse)
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
 func linkUserLinkedInAccount()
    {
        let userName = "Nick"
        let accessToken = "<Enter LinkedIn Access Token>"
        let accessTokenSecret = "<Enter LinkedIn Access Token Secret>"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
       // let socialService = App42API.buildSocialService as! SocialService
        socialService?.linkUserLinkedInAccount(userName, accessToken:accessToken, accessTokenSecret:accessTokenSecret, completionBlock:{ (success, response, exception) -> Void in
        
        if (success)
        {
        let social = response as! Social
        NSLog("userName is %@",social.userName)
        NSLog("linkedinAccessToken is %@",social.linkedinAccessToken)
        NSLog("Response String is %@", social.strResponse)
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
    
    func linkUserLinkedInAccountApiKey()
    {
        let userName = "Nick"
        let accessToken = "<Enter LinkedIn Access Token>"
        let accessTokenSecret = "<Enter LinkedIn Access Token Secret>"
        let linkedInApiKey = "<Enter LinkedIn Api Key>"
        let linkedInSecretKey = "<Enter LinkedIn Secret Key>"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.linkUserLinkedInAccount(userName, apiKey:linkedInApiKey, secretKey:linkedInSecretKey,accessToken:accessToken, accessTokenSecret:accessTokenSecret,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let social = response as! Social
            NSLog("userName is %@",social.userName)
            NSLog("linkedinAccessToken is %@",social.linkedinAccessToken)
            NSLog("Response String is %@", social.strResponse)
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
    
    func updateLinkedInStatus()
    {
        let userName = "Nick"
        let status = "Nick is using the App42 API"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.updateLinkedInStatus(userName, status:status,completionBlock:{ (success, response, exception) -> Void in
        
        if (success)
        {
        let social = response as! Social
        NSLog("userName is %@",social.userName)
        NSLog("status is %@",social.status)
        NSLog("Response String is %@", social.strResponse)
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

  func updateSocialStatusForAll()
    {
        let userName = "Nick"
        let status = "Nick is using the App42 API"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
       // let socialService = App42API.buildSocialService as! SocialService
        socialService?.updateSocialStatusForAll(userName, status:status,completionBlock:{ (success, response, exception) -> Void in
        
        if (success)
        {
        let social = response as! Social
        NSLog("userName is %@",social.userName)
        NSLog("status is %@",social.status)
        NSLog("Response String is %@", social.strResponse)
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
   func facebookLinkPost()
    {
        let  accessToken = "<Enter Facebook Access Token>"
        let message = "Welcome to ShepHertz"
        let link = "http://www.shephertz.com"
     //   App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
      //  let socialService = App42API.buildSocialService as! SocialService
        socialService?.facebookLinkPost(accessToken, link:link,message:message,completionBlock:{ (success, response, exception) -> Void in
        
        if (success)
        {
        let response = response as! App42Response
        NSLog("response=%@",response.strResponse)
        NSLog("isResponseSuccess=%d",response.isResponseSuccess)
        NSLog("Response String is %@", response.strResponse)
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

    func facebookLinkPostWithCustomThumbnail()
    {
        let accessToken = "<Enter Facebook Access Token>"
        let link = "http://www.shephertz.com"
        let message =  "Welcome to ShepHertz"
        let pictureUrl = "http://api.shephertz.com/images/cloud-api-services/app42-cloud-api-services.png"
        let fileName = "Buddy Image"
        let description = "Welcome to ShepHertz Home Page"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.facebookLinkPostWithCustomThumbnail(accessToken, link:link,message:message,pictureUrl:pictureUrl,fileName:fileName,description:description,completionBlock:{ (success, response, exception) -> Void in
        
        if (success)
        {
            let response = response as! App42Response
            NSLog("response=%@",response.strResponse)
            NSLog("isResponseSuccess=%d",response.isResponseSuccess)
            NSLog("Response String is %@", response.strResponse)
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

   func getFacebookProfile()
    {
        let accessToken = "<Enter Facebook Access Token>"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
       // let socialService = App42API.buildSocialService as! SocialService
        socialService?.getFacebookProfile(accessToken,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let social = response as! Social
            NSLog("Name=%@",social.facebookProfile.name);
            NSLog("Picture=%@",social.facebookProfile.picture);
            NSLog("Id=%@",social.facebookProfile.fbId);
            NSLog("Response String is %@", social.strResponse)
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

func facebookPublishStream()
    {
        let accessToken = "<Enter Facebook Access Token>"
        let fileName = "Buddy Image"
        let filePath = "http://api.shephertz.com/images/cloud-api-services/app42-cloud-api-services.png"
        let message =  "Welcome to ShepHertz"
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey: "SECRET_KEY")
        //let socialService = App42API.buildSocialService as! SocialService
        socialService?.facebookPublishStream(accessToken,fileName:fileName, filePath:filePath, message:message, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let response = response as! App42Response
            NSLog("response=%@",response.strResponse);
            NSLog("isResponseSuccess=%d",response.isResponseSuccess);
            NSLog("Response String is %@", response.strResponse)
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
