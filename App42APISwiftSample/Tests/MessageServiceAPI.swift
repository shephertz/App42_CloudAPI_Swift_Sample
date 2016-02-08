//
//  MessageServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 07/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class MessageServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let queueService = App42API.buildQueueService() as? QueueService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Message Service"
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
        if cellText == "CreatePullQueue"
        {
            createPullQueue()
        }
        else if cellText == "DeletePullQueue"
        {
            deletePullQueue()
        }
        else if cellText == "PurgePullQueue"
        {
            purgePullQueue()
        }
        else if cellText == "PendingMessages"
        {
            pendingMessages()
        }
        else if cellText == "GetMessages"
        {
            getMessages()
        }
        else if cellText == "SendMessage"
        {
            sendMessage()
        }
        else if cellText == "ReceiveMessage"
        {
            receiveMessage()
        }
        else if cellText == "ReceiveMessageByCorrelationId"
        {
            receiveMessageByCorrelationId()
        }
        else if cellText == "RemoveMessage"
        {
            removeMessage()
        }
    }
    
    func createPullQueue()
    {
        let queueName = "TestQueue"
        let queueDescription = "All kind of mobiles"
        
        queueService?.createPullQueue(queueName, description: queueDescription, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let queue = response as! Queue
                NSLog("Response=%@",queue.strResponse);
                NSLog("Description=%@",queue.description);
                for message in queue.messageArray
                {
                    NSLog("CorrelationId is =%@",message.correlationId)
                    NSLog("MessageId is =%@",message.messageId)
                    NSLog("Payload is  = %@",message.payLoad)
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
    
    func deletePullQueue()
    {
        let queueName = "TestQueue"
        
        queueService?.deletePullQueue(queueName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response=%@",app42Response.strResponse);
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
    
    func purgePullQueue()
    {
        let queueName = "TestQueue"
        
        queueService?.purgePullQueue(queueName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response=%@",app42Response.strResponse);
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
    
    func pendingMessages()
    {
        let queueName = "TestQueue"
        queueService?.pendingMessages(queueName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let queue = response as! Queue
                NSLog("Response=%@",queue.strResponse);
                for message in queue.messageArray
                {
                    NSLog("CorrelationId is =%@",message.correlationId)
                    NSLog("MessageId is =%@",message.messageId)
                    NSLog("Payload is  = %@",message.payLoad)
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
    
    func getMessages()
    {
        let queueName = "TestQueue"
        let timeOut = 10
        queueService?.getMessages(queueName, receiveTimeOut: timeOut, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let queue = response as! Queue
                NSLog("Response=%@",queue.strResponse);
                for message in queue.messageArray
                {
                    NSLog("CorrelationId is =%@",message.correlationId)
                    NSLog("MessageId is =%@",message.messageId)
                    NSLog("Payload is  = %@",message.payLoad)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
            }
        })
    }
    
    func sendMessage()
    {
        let queueName = "TestQueue"
        let messages = "Hello, how are you?"
        let timeOut = 10
        queueService?.sendMessage(queueName, message: messages, expiryTime: timeOut, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let queue = response as! Queue
                NSLog("Response=%@",queue.strResponse);
                for message in queue.messageArray
                {
                    NSLog("CorrelationId is =%@",message.correlationId)
                    NSLog("Payload is  = %@",message.payLoad)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
            }
        })
    }
    
    func receiveMessage()
    {
        let queueName = "TestQueue"
        let timeOut = 10
        
        queueService?.receiveMessage(queueName, receiveTimeOut: timeOut, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let queue = response as! Queue
                NSLog("Response=%@",queue.strResponse);
                for message in queue.messageArray
                {
                    NSLog("CorrelationId is =%@",message.correlationId)
                    NSLog("MessageId is =%@",message.messageId)
                    NSLog("Payload is  = %@",message.payLoad)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
            }
        })
    }
    
    func receiveMessageByCorrelationId()
    {
        let queueName = "TestQueue"
        let timeOut = 10
        let correlationId = ""
        queueService?.receiveMessageByCorrelationId(queueName, receiveTimeOut: timeOut, correlationId: correlationId, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let queue = response as! Queue
                NSLog("Response=%@",queue.strResponse);
                for message in queue.messageArray
                {
                    NSLog("CorrelationId is =%@",message.correlationId)
                    NSLog("MessageId is =%@",message.messageId)
                    NSLog("Payload is  = %@",message.payLoad)
                }
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
            }
        })
    }
    
    func removeMessage()
    {
        let queueName = "TestQueue"
        let messageId = ""

        queueService?.removeMessage(queueName, messageId: messageId, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response=%@",app42Response.strResponse);
            }
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
            }
        })
    }
}
