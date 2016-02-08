//
//  CatalogueServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 06/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class CatalogueServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    var catalogueService:CatalogueService? = nil
    var sessionId:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Catalogue Service"
        catalogueService = App42API.buildCatalogueService() as? CatalogueService
        sessionId = nil;
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
        if cellText == "CreateCatalogue"
        {
            createCatalogue()
        }
        else if cellText == "CreateCategory"
        {
            createCategory()
        }
        else if cellText == "AddItem"
        {
            addItem()
        }
        else if cellText == "GetItems"
        {
            getItems()
        }
        else if cellText == "GetItemsByCategory"
        {
            getItemsByCategory()
        }
        else if cellText == "GetItemsCountByCategory"
        {
            getItemsCountByCategory()
        }
        else if cellText == "GetItemsByCategoryByPaging"
        {
            getItemsByCategoryByPaging()
        }
        else if cellText == "GetItemById"
        {
            getItemById()
        }
        else if cellText == "RemoveAllItems"
        {
            removeAllItems()
        }
        else if cellText == "RemoveItemsByCategory"
        {
            removeItemsByCategory()
        }
        else if cellText == "RemoveItemById"
        {
            removeItemById()
        }

    }
    
    func createCatalogue()
    {
        let catalogueName = "Mobiles and Accessories"
        let description = "All kind of mobiles"
        
        catalogueService?.createCatalogue(catalogueName, catalogueDescription: description, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let catalogue = response as! Catalogue
                NSLog("Response=%@",catalogue.strResponse);
                NSLog("CatalogueName=%@",catalogue.name);
                NSLog("Description=%@",catalogue.description);
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
    
    func createCategory()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"
        let description = "All kind of iPhones"
        
        catalogueService?.createCategory(catalogueName, categoryName: categoryName, categoryDescription: description, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let catalogue = response as! Catalogue
                NSLog("Response=%@",catalogue.strResponse);
                NSLog("CatalogueName=%@",catalogue.name);
                
                let categoryList = catalogue.categoryListArray
                for category in categoryList {
                    NSLog("CategoryName = %@",category.name)
                    NSLog("CategoryDescription = %@",category.description)
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
    
    func addItem()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"
        
        let itemData = ItemData()
        itemData.itemId = "iPhone12354"
        itemData.name = "iPhone 5"
        itemData.image = "Image URL"
        itemData.description = "The finest and latest"
        itemData.price = 53500.0
        
        catalogueService?.addItem(catalogueName, categoryName: categoryName, itemData: itemData, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let catalogue = response as! Catalogue
                NSLog("Response=%@",catalogue.strResponse);
                NSLog("CatalogueName=%@",catalogue.name);
                
                let categoryList = catalogue.categoryListArray
                for category in categoryList {
                    NSLog("CategoryName = %@",category.name)
                    NSLog("CategoryDescription = %@",category.description)
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
    
    func getItems()
    {
        let catalogueName = "Mobiles and Accessories"
        
        catalogueService?.getItems(catalogueName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let catalogue = response as! Catalogue
                NSLog("Response=%@",catalogue.strResponse);
                NSLog("CatalogueName=%@",catalogue.name);
                
                let categoryList = catalogue.categoryListArray
                for category in categoryList {
                    NSLog("CategoryName = %@",category.name)
                    NSLog("CategoryDescription = %@",category.description)
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
    
    func getItemsByCategory()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"
        
        catalogueService?.getItemsByCategory(catalogueName, categoryName: categoryName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let catalogue = response as! Catalogue
                NSLog("Response=%@",catalogue.strResponse);
                NSLog("CatalogueName=%@",catalogue.name);
                
                let categoryList = catalogue.categoryListArray
                for category in categoryList {
                    NSLog("CategoryName = %@",category.name)
                    NSLog("CategoryDescription = %@",category.description)
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
    
    func getItemsCountByCategory()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"
        
        catalogueService?.getItemsCountByCategory(catalogueName, categoryName: categoryName, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response=%@",app42Response.strResponse);
                NSLog("Total Items = %d", app42Response.totalRecords)
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
    
    func getItemsByCategoryByPaging()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"
        let max:Int32 = 5
        let offset:Int32 = 0
    
        catalogueService?.getItemsByCategory(catalogueName, categoryName: categoryName, max:max, offset: offset, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let catalogue = response as! Catalogue
                NSLog("Response=%@",catalogue.strResponse);
                NSLog("CatalogueName=%@",catalogue.name);
                
                let categoryList = catalogue.categoryListArray
                for category in categoryList {
                    NSLog("CategoryName = %@",category.name)
                    NSLog("CategoryDescription = %@",category.description)
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
    
    func getItemById()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"
        let itemId = "Item_ID"
        catalogueService?.getItemById(catalogueName, categoryName: categoryName, itemId: itemId, completionBlock:{ (success, response, exception) -> Void in
            if(success)
            {
                let catalogue = response as! Catalogue
                NSLog("Response=%@",catalogue.strResponse);
                NSLog("CatalogueName=%@",catalogue.name);
                
                let categoryList = catalogue.categoryListArray
                for category in categoryList {
                    NSLog("CategoryName = %@",category.name)
                    NSLog("CategoryDescription = %@",category.description)
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
    
    func removeAllItems()
    {
        let catalogueName = "Mobiles and Accessories"
        catalogueService?.removeAllItems(catalogueName, completionBlock:{ (success, response, exception) -> Void in
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
    
    func removeItemsByCategory()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"

        catalogueService?.removeItemsByCategory(catalogueName, categoryName: categoryName, completionBlock:{ (success, response, exception) -> Void in
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
    
    func removeItemById()
    {
        let catalogueName = "Mobiles and Accessories"
        let categoryName = "iPhone"
        let itemId = "Item_ID"

        catalogueService?.removeItemById(catalogueName, categoryName: categoryName, itemId: itemId, completionBlock:{ (success, response, exception) -> Void in
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
}
