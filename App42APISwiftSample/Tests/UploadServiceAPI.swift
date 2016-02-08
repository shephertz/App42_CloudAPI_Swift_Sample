//
//  UploadServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 04/06/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class UploadServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var uploadService:UploadService? = nil
    var fileDescription = "This is my vatar"
    var filePath:String? = nil
    var fileType:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Upload Service"
        uploadService = App42API.buildUploadService() as? UploadService
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        filePath = NSBundle.mainBundle().pathForResource("App42Services", ofType: "plist")
        fileType = XML
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
            
            if cellText == "UploadFileFromPath"
            {
                UploadFileFromPath()
            }
            else if cellText == "UploadFileWithData"
            {
                UploadFileWithData()
            }
            else if cellText == "UploadFileForUserFromPath"
            {
                UploadFileForUserFromPath()
            }
            else if cellText == "UploadFileForUserWithData"
            {
                UploadFileForUserWithData()
            }
            else if cellText == "GetAllFilesCount"
            {
            }
            else if cellText == "GetAllFiles"
            {
            }
            else if cellText == "GetAllFilesByPaging"
            {
            }
            else if cellText == "GetFileByUser"
            {
            }
            else if cellText == "GetAllFilesCountByUser"
            {
            }
            else if cellText == "GetAllFilesByUser"
            {
            }
            else if cellText == "GetAllFilesByUserByPaging"
            {
            }
            else if cellText == "GetFileByName"
            {
            }
            else if cellText == "RemoveFileByUser"
            {
            }
            else if cellText == "RemoveAllFilesByUser"
            {
            }
            else if cellText == "RemoveAllFiles"
            {
            }
            else if cellText == "GetFilesCountByType"
            {
            }
            else if cellText == "GetFilesByType"
            {
            }
            else if cellText == "GetFilesByTypeByPaging"
            {
            }
            else if cellText == "GrantAccessOnFile"
            {
            }
            else if cellText == "RevokeAccessOnFile"
            {
            }
            else if cellText == "UploadFileForGroupFromPath"
            {
            }
            else if cellText == "UploadFileForGroupWithData"
            {
            }
    }
    
    func UploadFileFromPath()
    {
        let fileName = "services.plist"
        uploadService?.uploadFile(fileName, filePath:filePath, uploadFileType:fileType, fileDescription: fileDescription, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let upload = response as! Upload
                for file in upload.fileListArray{
                    NSLog("File Name = %@", file.name)
                    NSLog("Description = %@", file.description)
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
    
    func UploadFileWithData()
    {
        let fileName = "MyServices.plist"
        let data = NSData(contentsOfFile: filePath!)
        uploadService?.uploadFile(fileName, fileData: data, uploadFileType: fileType, fileDescription: fileDescription, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let upload = response as! Upload
                for file in upload.fileListArray{
                    NSLog("File Name = %@", file.name)
                    NSLog("Description = %@", file.description)
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
    
    func UploadFileForUserFromPath()
    {
        let fileName = "MyServices.plist"
        let userName = "Rajeev"
        uploadService?.uploadFileForUser(fileName, userName:userName, filePath: filePath, uploadFileType: fileType, fileDescription: fileDescription, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let upload = response as! Upload
                for file in upload.fileListArray{
                    NSLog("File Name = %@", file.name)
                    NSLog("Description = %@", file.description)
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
    
    func UploadFileForUserWithData()
    {
        
    }
}

