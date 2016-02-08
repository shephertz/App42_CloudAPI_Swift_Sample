//
//  GeoServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 29/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class GeoServiceAPI: UITableViewController {

   
    var apiList:NSArray? = nil
    let geoService = App42API.buildGeoService() as? GeoService
    var editScoreId:NSString? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Geo Service"
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
        if cellText == "CreateGeoPoints"
        {
           createGeoPoints()
        }
        else if cellText == "GetAllPoints"
        {
           getAllPoints()
        }
        else if cellText == "GetAllPointsByPaging"
        {
            getAllPointsByPaging()
        }
        else if cellText == "GetAllStorage"
        {
           getAllStorage()
        }
        else if cellText == "GetAllStorageByPaging"
        {
           getAllStorageByPaging()
        }
        else if cellText == "GetNearByPoint"
        {
            getNearByPoint()
        }
        else if cellText == "GetPointsWithInCircle"
        {
            getPointsWithInCircle()
        }
        else if cellText == "GetNearByPointsByMaxDistance"
        {
            getNearByPointsByMaxDistance()
        }
        else if cellText == "DeleteGeoPoints"
        {
            deleteGeoPoints()
        }
        else if cellText == "DeleteStorage"
        {
            deleteStorage()
        }
        

}
    func createGeoPoints()
    {
        let geostorageName = "<Your_storage_name>";
        let geoPointsList:NSMutableArray=NSMutableArray()
        let gp:GeoPoint = GeoPoint()
        gp.marker = "Maplewood,NJ"
        gp.latitude = -74.2713
        gp.longitude = 40.73137
        geoPointsList.addObject(gp)
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.createGeoPoints(geostorageName, geoPointsList: geoPointsList as [AnyObject],completionBlock:{ (success, response, exception) -> Void in
        
        if (success)
        {
        let geo = response as! Geo
        NSLog("storageName is %@", geo.storageName);
        for point in geo.pointList
        {
            NSLog("latitude is %f", point.lat);
            NSLog("longitude is %f", point.lng);
            NSLog("marker is %@", point.marker);
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
    
    func getAllPoints()
    {
        let  storageName = "<Your_storage_name>"
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.getAllPoints(storageName,completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let geo = response as! Geo
            NSLog("storageName is %@", geo.storageName)
            
            for point in geo.pointList
            {
                NSLog("latitude is %f", point.lat);
                NSLog("longitude is %f", point.lng);
                NSLog("marker is %@", point.marker);
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
    
    func getAllPointsByPaging()
    {
        let  storageName = "<Your_storage_name>"
        let max:Int32 = 1
        let offset:Int32 = 0
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.getAllPointsByPaging(storageName,max:max, offset:offset, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let geo = response as! Geo
        NSLog("storageName is %@", geo.storageName);
        for point in geo.pointList
        {
        NSLog("latitude is %f", point.lat);
        NSLog("longitude is %f", point.lng);
        NSLog("marker is %@", point.marker);
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
    func getAllStorage()
    {
       // App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.getAllStorage({ (success, response, exception) -> Void in
        if (success)
        {
            let geoList = response as! NSArray
            for geo in geoList
            {
              NSLog("storageName is %@", geo.storageName);
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
    func getAllStorageByPaging()
    {
        let max:Int32 = 1
        let offset:Int32 = 0
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.getAllStorageByPaging(max, offset:offset, completionBlock:{ (success, response, exception) -> Void in
        
        if (success)
        {
            let geoList = response as! NSArray
            for geo in geoList
            {
              NSLog("storageName is %@", geo.storageName)
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
    
   func getNearByPoint()
    {
        let storageName = "<Your_storage_name>"
        let lat = -73.99171
        let lng = 40.738868
        let resultLimit:Int32 = 2
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.getNearByPoint(storageName, latitude:lat,longitude:lng,resultLimit:resultLimit, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let geo = response as! Geo
            NSLog("storageName is %@", geo.storageName)
            for point in geo.pointList
            {
            NSLog("latitude is %f", point.lat)
            NSLog("longitude is %f", point.lng)
            NSLog("marker is %@", point.marker)
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
    func getPointsWithInCircle()
    {
        let storageName = "<Your_storage_name>"
        let lat = -73.99171
        let lng = 40.738868
        let radiusInKM = 1.00
        let resultLimit:Int32 = 2
       // App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
       // let geoService = App42API.buildGeoService as! GeoService
        geoService?.getPointsWithInCircle(storageName,latitude:lat,longitude:lng,radiusInKM:radiusInKM,resultLimit:resultLimit, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let geo = response as! Geo
            NSLog("storageName is %@", geo.storageName);
            for point in geo.pointList
            {
            NSLog("latitude is %f", point.lat)
            NSLog("longitude is %f", point.lng)
            NSLog("marker is %@", point.marker)
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
    func getNearByPointsByMaxDistance()
    {
        let storageName = "<Your_storage_name>"
        let lat = -73.99171
        let lng = 40.738868
        let  distanceInKM = 1.00
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.getNearByPointsByMaxDistance(storageName, latitude:lat,longitude:lng,distanceInKM:distanceInKM, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let geo = response as! Geo
        NSLog("storageName is %@", geo.storageName)
        for point in geo.pointList
        {
        NSLog("latitude is %f", point.lat)
        NSLog("longitude is %f", point.lng)
        NSLog("marker is %@", point.marker)
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
    func deleteGeoPoints()
    {
        let storageName = "<Your_storage_name>"
        let geoPointObj:GeoPoint=GeoPoint()
        geoPointObj.latitude = 22.77777
        geoPointObj.longitude = 55.2658
        geoPointObj.marker = "first Marker"
        let geoPointObj1:GeoPoint=GeoPoint()
        geoPointObj1.latitude = 22.565777
        geoPointObj1.longitude = 55.46986
        geoPointObj1.marker = "second Marker"
        let array:NSMutableArray = NSMutableArray()
        array.addObject(geoPointObj)
        array.addObject(geoPointObj1)
       // App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
       // let geoService = App42API.buildGeoService as! GeoService
        geoService?.deleteGeoPoints(array as [AnyObject], geoStorageName:storageName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
        let res = response as! Geo
        NSLog("Response success is : %d", res.isResponseSuccess)
        NSLog("Response String is %@", res.strResponse)
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
    func deleteStorage()
    {
        let storageName  = "<Your_storage_name>"
        //App42API.initializeWithAPIKey("API-KEY", andSecretKey: "SECRET_KEY")
        //let geoService = App42API.buildGeoService as! GeoService
        geoService?.deleteStorage(storageName, completionBlock:{ (success, response, exception) -> Void in
        if (success)
        {
            let response = response as! App42Response
            NSLog("Response success is : %d", response.isResponseSuccess)
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
