//
//  PhotoGalleryServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 29/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class PhotoGalleryServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let albumService = App42API.buildAlbumService() as? AlbumService
    let photoService = App42API.buildPhotoService() as? PhotoService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Photo Gallery Service"
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
        if cellText == "CreateAlbum"
        {
            createAlbum()
        }
        else if cellText == "GetAlbums"
        {
             getAlbums()
        }
        else if cellText == "GetAlbumsCount"
        {
           getAlbumsCount()
        }
        else if cellText == "GetAlbumsByPaging"
        {
            getAlbumsByPaging()
        }
        else if cellText == "GetAlbumByName"
        {
            getAlbumByName()
        }
        else if cellText == "AddPhotoFromPath"
        {
            addPhotoFromPath()
        }
        else if cellText == "AddTagToPhoto"
        {
            addTagToPhoto()
        }
        else if cellText == "GetPhotos"
        {
            getPhotos()
        }
        else if cellText == "GetTaggedPhotos"
        {
            getTaggedPhotos()
        }
        else if cellText == "GetPhotosByAlbumName"
        {
            getPhotosByAlbumName()
        }
        else if cellText == "GetPhotosByAlbumNameByPaging"
        {
            getPhotosByAlbumNameByPaging()
        }
        else if cellText == "GetPhotosCountByAlbumName"
        {
            getPhotosCountByAlbumName()
        }
        else if cellText == "GetPhotosByAlbumAndPhotoName"
        {
            getPhotosByAlbumAndPhotoName()
        }
        else if cellText == "RemoveAlbum"
        {
            removeAlbum()
        }
        else if cellText == "UpdatePhoto"
        {
            updatePhoto()
        }
        else if cellText == "RemovePhoto"
        {
            removePhoto()
        }

    }
    func createAlbum()
    {
    let userName = "Bhavs"
    let albumName = "Memories1"
    let description = "Memories....."
   // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
    //let albumService = App42API.buildAlbumService() as? AlbumService
    albumService?.createAlbum(userName, albumName: albumName, albumDescription: description, completionBlock: { (success,response, exception) -> Void in
    if (success)
    {
        let album = response as! Album
        NSLog("%@" ,album.userName)
        NSLog("%@",album.name)
    }
    else
    {
        NSLog("%@",exception.reason!)
        NSLog("%d",exception.httpErrorCode)
        NSLog("%d",exception.appErrorCode)
        NSLog("%@",exception.userInfo!)
    }
    })
   }
    func getAlbums()
    {
    let userName = "Bhavs"
    //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
    //let albumService = App42API.buildAlbumService() as? AlbumService
    albumService?.getAlbums(userName, completionBlock: { (success, response, exception) -> Void in
    if (success)
    {
        let albumList = response as! NSArray
        for album in albumList
        {
        NSLog("%@" , album.userName)
        NSLog("%@",album.name)
    }
    }
    else
    {
        NSLog("%@",exception.reason!)
        NSLog("%d",exception.httpErrorCode)
        NSLog("%d",exception.appErrorCode)
        NSLog("%@",exception.userInfo!)
    }
    })
   }
    func getAlbumsCount()
    {
        let userName = "Bhavs"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let albumService = App42API.buildAlbumService() as? AlbumService
        albumService?.getAlbumsCount(userName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let response = response as! App42Response
        NSLog("%@", response.strResponse)
        NSLog("%@", response.isResponseSuccess)
        
        }
        else
        {
        NSLog("%@",exception.reason!)
        NSLog("%d",exception.httpErrorCode)
        NSLog("%d",exception.appErrorCode)
        NSLog("%@",exception.userInfo!)
        }
        })
    }
    
    func getAlbumsByPaging()
    {
        let userName = "Bhavs"
        let max:Int32 = 1
        let offset:Int32 = 0
       // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let albumService = App42API.buildAlbumService() as? AlbumService
        albumService?.getAlbums(userName, max:max, offset: offset, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
        let albumList = response as! NSArray
        for album in albumList
        {
        NSLog("%@" , album.userName)
        NSLog("%@",album.name)
        }
        
        }
        else
        {
        NSLog("%@",exception.reason!)
        NSLog("%d",exception.httpErrorCode)
        NSLog("%d",exception.appErrorCode)
        NSLog("%@",exception.userInfo!)
        }
        })
   }
   func getAlbumByName()
    {
        let userName = "Bhavs"
        let albumName = "Memories1"
      //  App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let albumService = App42API.buildAlbumService() as? AlbumService
        albumService?.getAlbumByName(userName, albumName:albumName, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let album = response as! Album
            NSLog("%@" , album.userName)
            NSLog("%@",album.name)
        }
        else
        {
            NSLog("%@",exception.reason!)
            NSLog("%d",exception.httpErrorCode)
            NSLog("%d",exception.appErrorCode)
            NSLog("%@",exception.userInfo!)
        }
       })
    }
    func addPhotoFromPath()
    {
        let userName = "Bhavika"
        let albumName = "Memories"
        let description = "Memories...."
        let photoName  = "My Photo"
        let filePath = NSBundle.mainBundle().pathForResource("Image", ofType: "png")
      //  App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let albumService = App42API.buildAlbumService() as? AlbumService
        photoService?.addPhoto(userName, albumName: albumName, photoName: photoName, photoDescription: description, path: filePath, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let albumList = response as! [Album]
            for album in albumList
            {
                NSLog("%@" , album.userName)
                NSLog("%@",album.name)
                let photoList = album.photoList
                for photo in photoList
                {
                    NSLog("%@",photo.name);
                    NSLog("%@",photo.description);
                    NSLog("%@",photo.url);
                    NSLog("%@",photo.thumbNailUrl);
                }
            }
        }
        else
        {
            NSLog("%@",exception.reason!)
            NSLog("%d",exception.httpErrorCode)
            NSLog("%d",exception.appErrorCode)
            NSLog("%@",exception.userInfo!)
        }
        })
    }
    
    func addTagToPhoto()
    {
    let userName = "Bhavika"
    let albumName = "Memories"
    let photoName  = "My Photo"
    let taglistArray:NSMutableArray = NSMutableArray();
    taglistArray.addObject("Bhavs")
  //  App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
   // let photoService = App42API.buildPhotoService() as? PhotoService
    photoService?.addTagToPhoto(userName, albumName:albumName, photoName:photoName, tagList: taglistArray as [AnyObject], completionBlock: { (success, response, exception) -> Void in
    if (success)
    {
        let album = response as! Album
        NSLog("%@" , album.userName)
        NSLog("%@",album.name)
        let photoList = album.photoList
        for photo in photoList
        {
            NSLog("%@",photo.name);
            NSLog("%@",photo.url);
            NSLog("%@",photo.createdOn);
        }
    }
    else
    {
        NSLog("%@",exception.reason!)
        NSLog("%d",exception.httpErrorCode)
        NSLog("%d",exception.appErrorCode)
        NSLog("%@",exception.userInfo!)
    }
  
    })
}

   func getPhotos()
    {

        let userName = "Bhavika"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let photoService = App42API.buildPhotoService() as? PhotoService
        photoService?.getPhotos (userName, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let albumList = response as! [Album]
                for album in albumList
                {
                    NSLog("%@" , album.userName)
                    NSLog("%@",album.name)
                    let photoList = album.photoList
                    for photo in photoList
                    {
                        NSLog("%@",photo.name);
                        NSLog("%@",photo.description);
                        NSLog("%@",photo.url);
                        NSLog("%@",photo.thumbNailUrl);
                    }
                }
            }
            else
            {
                NSLog("%@",exception.reason!)
                NSLog("%d",exception.httpErrorCode)
                NSLog("%d",exception.appErrorCode)
                NSLog("%@",exception.userInfo!)  
            }   
          })
      }

func getTaggedPhotos()
{
    let userName = "Bhavika"
    let tag = "Bhavs"
   // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
   // let photoService = App42API.buildPhotoService() as? PhotoService
    photoService?.getTaggedPhotos (userName,tag:tag, completionBlock: { (success, response, exception) -> Void in
        if (success)
        {
            let albumList = response as! [Album]
            for album in albumList
            {
                NSLog("%@" , album.userName)
                NSLog("%@",album.name)
                let photoList = album.photoList
                for photo in photoList
                {
                    NSLog("%@",photo.name);
                    NSLog("%@",photo.description);
                    NSLog("%@",photo.url);
                    NSLog("%@",photo.thumbNailUrl);
                }
            }
        }
        
        else
        {
            NSLog("%@",exception.reason!)
            NSLog("%d",exception.httpErrorCode)  
            NSLog("%d",exception.appErrorCode)  
            NSLog("%@",exception.userInfo!)  
        }   
        })
       }

    func getPhotosByAlbumName()
    {
        let userName = "Bhavika"
        let albumName  = "Memories"
        //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
        //let photoService = App42API.buildPhotoService() as? PhotoService
        photoService?.getPhotosByAlbumName(userName, albumName: albumName, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let albumList = response as! [Album]
                for album in albumList
                {
                    NSLog("%@" , album.userName)
                    NSLog("%@",album.name)
                    let photoList = album.photoList
                    for photo in photoList
                    {
                        NSLog("%@",photo.name);
                        NSLog("%@",photo.description);
                        NSLog("%@",photo.url);
                        NSLog("%@",photo.thumbNailUrl);
                    }
                }
            }
            else
            {
                NSLog("%@",exception.reason!)
                NSLog("%d",exception.httpErrorCode)  
                NSLog("%d",exception.appErrorCode)  
                NSLog("%@",exception.userInfo!)  
            }   
       })
      }
    
    func getPhotosByAlbumNameByPaging()
    {
        let userName = "Nick"
        let albumName  = "My Album"
        let max:Int32 = 1
        let offset:Int32 = 0
      //  App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
      //  let photoService = App42API.buildPhotoService() as? PhotoService
         photoService?.getPhotosByAlbumName( max, offset:offset, userName: userName, albumName: albumName, completionBlock: { (success, response, exception) -> Void in
            if (success)
            {
                let albumList = response as! [Album]
                for album in albumList
                {
                    NSLog("%@" , album.userName)
                    NSLog("%@",album.name)
                    let photoList = album.photoList
                    for photo in photoList
                    {
                        NSLog("%@",photo.name);
                        NSLog("%@",photo.description);
                        NSLog("%@",photo.url);
                        NSLog("%@",photo.thumbNailUrl);
                    }
                }
            }
                else
                    {
                        NSLog("%@",exception.reason!)
                        NSLog("%d",exception.httpErrorCode)  
                        NSLog("%d",exception.appErrorCode)  
                        NSLog("%@",exception.userInfo!)  
                    }
            })
    }
        
    func getPhotosCountByAlbumName()
        {
            let userName = "Bhavika"
            let albumName  = "Memories"
          //  App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
           // let photoService = App42API.buildPhotoService() as? PhotoService
            photoService?.getPhotosCountByAlbumName(userName, albumName: albumName, completionBlock:{ (success, response, exception) -> Void in
                if (success)
                {
                    let response = response as! App42Response
                    NSLog("%@", response.strResponse)
                    NSLog("%@", response.isResponseSuccess)
                }
                
                else
                {
                    NSLog("%@",exception.reason!)
                    NSLog("%d",exception.httpErrorCode)
                    NSLog("%d",exception.appErrorCode)  
                    NSLog("%@",exception.userInfo!)  
                }
            })
         }
    
        func getPhotosByAlbumAndPhotoName()
            {
            let userName = "Bhavika"
            let albumName  = "Memories"
            let photoName  = "My Photo"
          //  App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
           // let photoService = App42API.buildPhotoService() as? PhotoService
                photoService?.getPhotosByAlbumAndPhotoName(userName, albumName: albumName, photoName: photoName, completionBlock: { (success, response, exception) -> Void in
                if (success)
                {
                    let albumList = response as! [Album]
                    for album in albumList
                    {
                        NSLog("%@" , album.userName)
                        NSLog("%@",album.name)
                        let photoList = album.photoList
                        for photo in photoList
                        {
                            NSLog("%@",photo.name);
                            NSLog("%@",photo.description);
                            NSLog("%@",photo.url);
                            NSLog("%@",photo.thumbNailUrl);
                        }
                    }
                }
                else
                {
                    NSLog("%@",exception.reason!)
                    NSLog("%d",exception.httpErrorCode)
                    NSLog("%d",exception.appErrorCode)
                    NSLog("%@",exception.userInfo!)  
                }
                })
            }
            
        func removeAlbum()
        {
            let userName = "Bhavs"
            let albumName  = "Memories1"
            //App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
            //let albumService = App42API.buildAlbumService() as? AlbumService
            albumService?.removeAlbum(userName, albumName: albumName, completionBlock: { (success, response, exception) -> Void in
                if (success)
                {
                    let response = response as! App42Response
                    NSLog("%@", response.strResponse)
                    NSLog("%@", response.isResponseSuccess)
                }
                else
                {
                    NSLog("%@",exception.reason!)
                    NSLog("%d",exception.httpErrorCode)  
                    NSLog("%d",exception.appErrorCode)  
                    NSLog("%@",exception.userInfo!)  
                }   
            })
        }
        func removePhoto()
        {
            let userName = "Bhavs"
            let photoName  = "My Photo"
            let albumName  = "Memories"
          //  App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
           // let photoService = App42API.buildPhotoService() as? PhotoService
            photoService?.removePhoto(userName, albumName: albumName, photoName: photoName, completionBlock: { (success, response, exception) -> Void in
                if (success)
                {
                    let response = response as! App42Response
                    NSLog("%@", response.strResponse)
                    NSLog("%@", response.isResponseSuccess)
                }
                
                else
                {
                    NSLog("%@",exception.reason!)
                    NSLog("%d",exception.httpErrorCode)  
                    NSLog("%d",exception.appErrorCode)  
                    NSLog("%@",exception.userInfo!)  
                }
             })
         }
       func updatePhoto()
        {
            let userName = "Bhavs"
            let albumName = "Memories"
            let photoDescription = "...."
            let photoName  = "My Photo"
              let filePath = NSBundle.mainBundle().pathForResource("Image", ofType: "png")
           // App42API.initializeWithAPIKey("APP_KEY", andSecretKey:"SECRET_KEY")
            //let photoService = App42API.buildPhotoService() as? PhotoService
            photoService?.updatePhoto(userName, albumName:albumName, photoName:photoName, photoDescription:photoDescription, path:filePath, completionBlock: { (success, response, exception) -> Void in
                if (success)
                {
                    let albumList = response as! [Album]
                    for album in albumList
                    {
                        NSLog("%@" , album.userName)
                        NSLog("%@",album.name)
                        let photoList = album.photoList
                        for photo in photoList
                        {
                            NSLog("%@",photo.name);
                            NSLog("%@",photo.description);
                            NSLog("%@",photo.url);
                            NSLog("%@",photo.thumbNailUrl);
                        }
                    }
                }
                else
                {
                    NSLog("%@",exception.reason!)
                    NSLog("%d",exception.httpErrorCode)
                    NSLog("%d",exception.appErrorCode)  
                    NSLog("%@",exception.userInfo!)  
                }   
        })
    }
}
