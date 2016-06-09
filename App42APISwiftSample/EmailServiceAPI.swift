//
//  EmailServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 29/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class EmailServiceAPI: UITableViewController {
    var apiList:NSArray? = nil
    let emailService = App42API.buildEmailService() as? EmailService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Email Service"
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
        if cellText == "CreateEmailConfiguration"
        {
           createEmailConfiguration()
        }
        else if cellText == "GetEmailConfiguration"
        {
            getEmailConfiguration()
        }
        else if cellText == "SendEmail"
        {
            sendEmail()
        }
        else if cellText == "RemoveEmailConfiguration"
        {
           removeEmailConfiguration()
        }
        else if cellText == "SendMailwithcustominfo"
        {
           sendMailwithcustominfo()
        }
        else if cellText == "RemoveEmailConfigurationexceptionhandling"
        {
            removeEmailConfigurationexceptionhandling()
        }
        
    }
    
    func createEmailConfiguration()
    {
        let emailHost = "smtp.gmail.com"
        let emailPort:Int32 =  465
        let emailId =  "nick@gmail.com"
        let password =  "********"
        let isSSL = true
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let emailService = App42API.buildEmailService() as? EmailService
        emailService?.createEmailConfiguration(emailHost, emailPort:emailPort, emailId:emailId, emailPassword:password, isSSL:isSSL, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let email = response as! Email
            let configurationArray = email.configurationArray
            for configuration in configurationArray
            {
                let config = configuration as! Configurations
                NSLog("%@",config.emailId)
                NSLog("%@",config.host)
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
    
    func getEmailConfiguration()
    {
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let emailService = App42API.buildEmailService() as? EmailService
        emailService?.getEmailConfiguration({ (success, response, exception) -> Void in
        if(success)
        {
            let email = response as! Email
            let configurationArray = email.configurationArray
            for configuration in configurationArray
            {
                let config = configuration as! Configurations
                NSLog("%@",config.emailId)
                NSLog("%@",config.host)
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
    func sendEmail()
    {
        let sendTo = "john@shephertz.co.in"
        let sendSubject  = "Feedback"
        let sendMsg = "Your message"
        let senderEmailId = "nick@gmail.com"
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let emailService = App42API.buildEmailService() as? EmailService
        emailService?.sendMail(sendTo, subject:sendSubject, message:sendMsg, fromEmail:senderEmailId, emailMIME:PLAIN_TEXT_MIME_TYPE, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let email = response as! Email
            NSLog("%@",email.to)
            NSLog("%@",email.from)
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
    func removeEmailConfiguration()
    {
        let emailId =  "nick@gmail.com"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let emailService = App42API.buildEmailService() as? EmailService
        emailService?.removeEmailConfiguration(emailId, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let response = response as! App42Response
            NSLog("%@", response.strResponse)
            NSLog("%@", response.isResponseSuccess)
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
    
    func sendMailwithcustominfo()
    {
        let sendTo = "john@shephertz.co.in"
        let sendSubject  = "Feedback"
        let sendMsg = "Your message"
        let senderEmailId = "nick@gmail.com"
        let otherMetaHeaders = NSMutableDictionary(object:"Your Template Name", forKey:"template")
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let emailService = App42API.buildEmailService() as? EmailService
        emailService?.otherMetaHeaders = otherMetaHeaders
        emailService?.sendMail(sendTo, subject:sendSubject, message:sendMsg, fromEmail:senderEmailId, emailMIME:PLAIN_TEXT_MIME_TYPE, completionBlock: { (success, response, exception) ->Void in
        if (success)
        {
            let email = response as! Email
            NSLog("%@" , email.from)
            NSLog("%@" , email.to)
            NSLog("%@" , email.strResponse)
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
    func removeEmailConfigurationexceptionhandling()
    {
        let emailId = "nick@gmail.com"
        App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        let emailService = App42API.buildEmailService() as? EmailService
        emailService?.removeEmailConfiguration(emailId, completionBlock: { (success, response, exception) ->Void in
        if (success)
        {
         //let email = response as! Email
        }
        else
        {
            let appErrorCode = exception.appErrorCode
            //let httpErrorCode = exception.httpErrorCode
            if(appErrorCode == 2303)
            {
             // Handle here for Not Found (Email with the id 'nick@shephertz.co.in' does not exist.)
            }
            else if(appErrorCode == 1401)
            {
            // handle here for Client is not authorized
            }
                
            else if(appErrorCode == 1500)
            {
            // handle here for Internal Server Error
            }
            //var jsonText = exception.reason!
        }
     })
    }
}


