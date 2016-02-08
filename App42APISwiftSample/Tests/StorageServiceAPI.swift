//
//  StorageServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Himanshu Sharma on 07/01/2015.
//  Copyright (c) 2015 Himanshu Sharma. All rights reserved.
//

import UIKit

class StorageServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var storageService:StorageService? = nil
    var objectId:NSString = ""
    var dbName = "jsonDocument2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Storage Service"
        storageService = App42API.buildStorageService() as? StorageService
        objectId = "";
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
        if cellText == "InsertDocFromJsonString"
        {
            InsertDocFromJsonString()
        }
        else if cellText == "InsertDocFromDictionary"
        {
            InsertDocFromDictionary()
        }
        else if cellText == "FindAllDocs"
        {
            FindAllDocs()
        }
        else if cellText == "FindAllDocsByPaging"
        {
            FindAllDocsByPaging()
        }
        else if cellText == "FindAllDocsCount"
        {
            FindAllDocsCount()
        }
        else if cellText == "FindAllCollections"
        {
            FindAllCollections()
        }
        else if cellText == "FindDocumentById"
        {
            FindDocumentById()
        }
        else if cellText == "FindDocumentByKeyValue"
        {
            FindDocumentByKeyValue()
        }
        else if cellText == "FindDocumentByQuery"
        {
            FindDocumentByQuery()
        }
        else if cellText == "FindDocumentsByQueryWithPaging"
        {
            FindDocumentsByQueryWithPaging()
        }
        else if cellText == "FindDocsWithQueryPagingOrderBy"
        {
            FindDocsWithQueryPagingOrderBy()
        }
        else if cellText == "UpdateDocumentByIdFromJsonString"
        {
           UpdateDocumentByIdFromJsonString()
        }
        else if cellText == "UpdateDocumentByIdFromDictionary"
        {
            UpdateDocumentByIdFromDictionary()
        }
        else if cellText == "UpdateDocumentByKeyValueFromJsonString"
        {
            UpdateDocumentByKeyValueFromJsonString()
        }
        else if cellText == "UpdateDocumentByKeyValueFromDictionary"
        {
            UpdateDocumentByKeyValueFromDictionary()
        }
        else if cellText == "UpdateDocumentByQueryFromJsonString"
        {
            UpdateDocumentByQueryFromJsonString()
        }
        else if cellText == "UpdateDocumentByQueryFromDictionary"
        {
            UpdateDocumentByQueryFromDictionary()
        }
        else if cellText == "SaveOrUpdateDocumentByKeyValueFromJsonString"
        {
            SaveOrUpdateDocumentByKeyValueFromJsonString()
        }
        else if cellText == "SaveOrUpdateDocumentByKeyValueFromDictionary"
        {
            SaveOrUpdateDocumentByKeyValueFromDictionary()
        }
        else if cellText == "DeleteAllDocuments"
        {
            DeleteAllDocuments()
        }
        else if cellText == "DeleteDocumentById"
        {
         DeleteDocumentById()
        }
        else if cellText == "DeleteDocumentsByKeyValue"
        {
            DeleteDocumentsByKeyValue()
        }
        else if cellText == "AddOrUpdateKeys"
        {
            AddOrUpdateKeys()
        }
        else if cellText == "InsertJsonDocUsingMap"
        {
            InsertJsonDocUsingMap()
        }
        else if cellText == "MapReduce"
        {
            MapReduce()
        }
    }
    
    func InsertDocFromJsonString()
    {
        let userName = "bhavika"
        let collectionName = "Demo1"
        let jsonString = "{\"Name\":\"Nick\",\"Age\":24}"
        App42API.setLoggedInUser(userName)
        storageService?.insertJSONDocument(dbName, collectionName: collectionName, json:jsonString, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func InsertDocFromDictionary()
    {
        let userName = "HimanshuSSharma"
        let collectionName = "Demo"
        let jsonDictionary = NSDictionary(object:"Nick", forKey:"name")
        App42API.setLoggedInUser(userName)
        storageService?.insertJSONDocument(dbName, collectionName: collectionName, dataDict:jsonDictionary as [NSObject : AnyObject], completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindAllDocs()
    {
         
        let collectionName = "Demo"
        storageService?.findAllDocuments(dbName, collectionName: collectionName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func FindAllDocsByPaging()
    {
        
        let collectionName = "Demo"
        storageService?.findAllDocuments(dbName, collectionName: collectionName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocumentById()
    {
        
        let collectionName = "Demo"
        let docId =  objectId
        storageService?.findDocumentById(dbName, collectionName: collectionName,docId:docId as String, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocumentByKeyValue()
    {
        
        let collectionName = "Demo"
        let key = "name"
        let value = "Nick"
        storageService?.findDocumentByKeyValue(dbName, collectionName: collectionName,key:key,value:value, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocumentByQuery()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Nick"
        let query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.findDocumentsByQuery(query,dbName:dbName, collectionName: collectionName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func FindDocumentsByQueryWithPaging()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Nick"
        let max:Int32 = 5
        let offset:Int32 = 0
        let query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.findDocumentsByQueryWithPaging(dbName, collectionName: collectionName,query:query,max:max,offset:offset, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindDocsWithQueryPagingOrderBy()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Nick"
        let max:Int32 = 5
        let offset:Int32 = 0
        let query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.findDocsWithQueryPagingOrderBy(dbName, collectionName: collectionName,query:query,max:max,offset:offset,orderByKey:key,orderByType:APP42_ORDER_ASCENDING, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func UpdateDocumentByIdFromJsonString()
    {         
        let collectionName = "Demo"
        let docId =  objectId
        let newJSONDoc = "{\"name\":\"Himanshu Sharma\"}"
        storageService?.updateDocumentByDocId(dbName, collectionName: collectionName,docId:docId as String,newJsonDoc:newJSONDoc, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func UpdateDocumentByIdFromDictionary()
    {
        let collectionName = "Demo"
        let docId =  objectId
        let newJSONDoc = ["name":"Nick"]//NSDictionary(object:"Sachin Grover", forKey:"name")
        storageService?.updateDocumentByDocId(dbName, collectionName: collectionName,docId:docId as String,newDataDict:newJSONDoc, completionBlock: { (success, response, exception)   -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func UpdateDocumentByKeyValueFromJsonString()
    {
        
        let collectionName = "Demo"
        let key = "name"
        let value = "Himanshu Sharma"
        let newJSONDoc = "{\"name\":\"Shashank Shukla\"}"
        
        storageService?.updateDocumentByKeyValue(dbName, collectionName: collectionName, key: key, value: value, newJsonDoc: newJSONDoc, completionBlock: { (success, response, exception)   -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func UpdateDocumentByKeyValueFromDictionary()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Shashank Shukla"
        let newJSONDoc = ["name":"Shashank"]//NSDictionary(object:"Shikha", forKey:"name")
        storageService?.updateDocumentByKeyValue(dbName, collectionName:collectionName, key:key, value:value, newDataDict:newJSONDoc, completionBlock: { (success, response, exception)   -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    
    func UpdateDocumentByQueryFromJsonString()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Nick"
        let newJSONDoc = "{\"name\":\"Himanshu\"}"
        let query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.updateDocumentByQuery(dbName, collectionName: collectionName,query:query,newJsonDoc:newJSONDoc, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    
    func UpdateDocumentByQueryFromDictionary()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Shikha"
        let newJSONDoc = ["name":"Nick"]
        let query = QueryBuilder.buildQueryWithKey(key, value: value, andOperator:APP42_OP_EQUALS)
        storageService?.updateDocumentByQuery(dbName, collectionName:collectionName, query:query, newDataDict:newJSONDoc, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    
    func SaveOrUpdateDocumentByKeyValueFromJsonString()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Shikha"
        let newJSONDoc = "{\"name\":\"Himanshu\"}"
        storageService?.saveOrUpdateDocumentByKeyValue(dbName, collectionName: collectionName, key:key, value:value, newJsonDoc:newJSONDoc, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func SaveOrUpdateDocumentByKeyValueFromDictionary()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Shikha"
        let newJSONDoc = ["name":""]//NSDictionary(object:"Nick John", forKey:"name")
        storageService?.saveOrUpdateDocumentByKeyValue(dbName, collectionName: collectionName,key:key,value:value,dataDict:newJSONDoc, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func AddOrUpdateKeys()
    {
        let collectionName = "Demo"
        let docId:String = objectId as String
        let newJSONDoc = ["name":"Nick Johnsan"]
        storageService?.addOrUpdateKeys(dbName, collectionName:collectionName, docId:docId, dataDict:newJSONDoc, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    func InsertJsonDocUsingMap()
    {
        let collectionName = "Demo"
        let newJSONDoc = NSMutableDictionary()
        newJSONDoc["name"] = "Shephertz"
        newJSONDoc["age"] = 4
        
        storageService?.insertJsonDocUsingMap(dbName, collectionName: collectionName ,map:newJSONDoc, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let storage = response as! Storage
                NSLog("%@", storage.dbName)
                NSLog("%@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList {
                    NSLog("%@",jsonDoc.docId)
                    NSLog("%@",jsonDoc.createdAt)
                    NSLog("%@",jsonDoc.updatedAt)
                    NSLog("%@",jsonDoc.jsonDoc)
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
    
    func FindAllDocsCount()
    {
        let collectionName = "Demo"
        storageService?.findAllDocumentsCount(dbName, collectionName:collectionName, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%d", app42Response.totalRecords)
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
    func FindAllCollections()
    {
        storageService?.findAllCollections(dbName, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.totalRecords)
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
    
    func DeleteAllDocuments()
    {
        let collectionName = "Demo"
        storageService?.deleteAllDocuments(dbName, collectionName:collectionName, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.isResponseSuccess)
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
    
    func DeleteDocumentById()
    {
        let collectionName = "Demo"
        let docId = objectId as String
        storageService?.deleteDocumentById(dbName, collectionName:collectionName, docId:docId, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.isResponseSuccess)
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
    func DeleteDocumentsByKeyValue()
    {
        let collectionName = "Demo"
        let key = "name"
        let value = "Shephertz"
        storageService?.deleteDocumentsByKeyValue(dbName, collectionName: collectionName, key:key,value:value, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("%@", app42Response.strResponse)
                NSLog("%@", app42Response.isResponseSuccess)
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
    func MapReduce()
    {
        let collectionName = "Demo"
        let mapFunction = "function map(){ emit(this.user,1);}"
        let reduceFunction = "function reduce(key, val){var sum = 0; for(var n=0;n< val.length;n++){ sum = sum + val[n]; } return sum;}"
        storageService?.mapReduce(dbName, collectionName: collectionName,mapFunction:mapFunction ,reduceFunction:reduceFunction , completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! NSString
                NSLog("%@", app42Response)
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