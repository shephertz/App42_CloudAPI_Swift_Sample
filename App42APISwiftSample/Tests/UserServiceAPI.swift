//
//  UserServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 22/12/14.
//  Copyright (c) 2014 Rajeev Ranjan. All rights reserved.
//

import UIKit

class UserServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let userService = App42API.buildUserService() as? UserService
    var sessionId:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "User Service"
        //userService = App42API.buildUserService() as? UserService
        sessionId = nil;
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
        if cellText == "CreateUser"
        {
            createUser()
        }
        else if cellText == "CreateUserWithRoles"
        {
            createUserWithRoles()
        }
        else if cellText == "CreateOrUpdateProfile"
        {
            createOrUpdateProfile()
        }
        else if cellText == "AssignRoles"
        {
            assignRoles()
        }
        else if cellText == "GetRolesByUser"
        {
            getRolesByUser()
        }
        else if cellText == "GetUsersByRole"
        {
            getUsersByRole()
        }
        else if cellText == "GetAllUsersCount"
        {
            getAllUsersCount()
        }
        else if cellText == "GetLockedUsersCount"
        {
            getLockedUsersCount()
        }
        else if cellText == "GetAllUsers"
        {
            getAllUsers()
        }
        else if cellText == "GetAllUsersByPaging"
        {
            getAllUserWithPaging()
        }
        else if cellText == "GetLockedUsers"
        {
            getLockedUsers()
        }
        else if cellText == "GetLockedUsersByPaging"
        {
            getLockedUsersWithPaging()
        }
        else if cellText == "GetUserByEmailId"
        {
           getUserByEmailId()
        }
        else if cellText == "AuthenticateUser"
        {
            authenticateUser()
        }
        else if cellText == "LockUser"
        {
            lockUser()
        }
        else if cellText == "UnlockUser"
        {
            unlockUser()
        }
        else if cellText == "ChangeUserPassword"
        {
            changeUserPassword()
        }
        else if cellText == "ResetUserPassword"
        {
            resetUserPassword()
        }
        else if cellText == "RevokeRole"
        {
            revokeRole()
        }
        else if cellText == "RevokeAllRoles"
        {
            revokeAllRoles()
        }
        else if cellText == "GetUsersByProfileData"
        {
            getUsersByProfileData()
        }
        else if cellText == "Logout"
        {
            logOut()
        }
        else if cellText == "DeleteUser"
        {
            deleteUser()
        }
        else if cellText == "GetUserByName"
        {
            getUser()
        }
        else if cellText == "CreateUserWithProfile"
        {
            createUserWithProfile()
        }
        else if cellText == "GetUsersByGroup"
        {
            getUsersByGroup()
        }
        else if cellText == "ResetUserPasswordWithCustomName"
        {
            resetUserPasswordWithCustomName()
        }
        else if cellText == "ResetUserPasswordWithEmailVerification"
        {
            resetUserPasswordWithEmailVerification()
        }
        else if cellText == "GetAllUsersWithAdvancedSearch"
        {
            getAllUsersWithAdvancedSearch()
        }
        else if cellText == "GetProfileWithAuthenticateUser"
        {
            getProfileWithAuthenticateUser()
        }
        
    }
    
    func createUser()
    {
        NSLog("Create User")
        let userName = "NickAtShephertz"
        let password = "123456"
        let emailAddress = "NickAtShephertz@shephertz.com"
        let userInfo = NSDictionary(object:"John",forKey:"name")
        let dbName = ""
        let collectionName = ""
        App42API.setDbName(dbName);
        userService?.addUserInfo(userInfo as [NSObject : AnyObject],collectionName:collectionName,  completionBlock: { (success, response, exception) -> Void in
            NSLog("Add json object User")
        })
        
        NSLog("Create User")
        userService?.createUser(userName, password: password, emailAddress:emailAddress, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
                NSLog("%@", user.sessionId)
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
    
    func createUserWithRoles()
    {
        NSLog("Create User With Roles")
        let userName = "HimanshusShephertz12"
        let password = "123456"
        let emailAddress = "nick12.s12hephertz@shephertz.com"
        let roles = ["COO","Lead"]
        userService?.createUser(userName, password: password, emailAddress: emailAddress, roleList: roles, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
                NSLog("%@", user.sessionId)
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
    
    
    func createUserWithProfile()
    {
        let userName = "Nick"
        let password = "*****"
        let emailId = "nick@shephertz.co.in"
        let profile = Profile()
        profile.firstName = "Nick"
        profile.lastName = "Gill"
        profile.sex = MALE
        profile.dateOfBirth = NSDate(timeIntervalSinceNow: 0)
        profile.city = "Houston"
        profile.state = "Texas"
        profile.pincode = "74193"
        profile.country = "USA"
        profile.mobile = "+1-1111-111-111"
        profile.homeLandLine = "+1-2222-222-222"
        profile.officeLandLine = "+1-33333-333-333"
        userService?.createUserWithProfile(userName, password: password, emailAddress: emailId, profile: profile, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let updatedUser = response as! User
                NSLog("User Name = %@", updatedUser.userName)
                NSLog("First Name = %@", updatedUser.profile.firstName)
                NSLog("Sex = %@", updatedUser.profile.sex)
                NSLog("Date Of Birth = %@", updatedUser.profile.dateOfBirth)
                NSLog("City = %@", updatedUser.profile.city)
                NSLog("state = %@", updatedUser.profile.state)
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
    
    
    func createOrUpdateProfile()
    {
        NSLog("Create User With Roles")
        let userName = "HimanshusShephertz23123234"
        let password = "123456"
        let emailAddress = "nick12223334.s12hephertz@shephertz.com"
        
        userService?.createUser(userName, password: password, emailAddress:emailAddress, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let user = response as! User
                let profile = Profile()
                profile.firstName = "Nick"
                profile.lastName = "Gill"
                profile.sex = MALE
                profile.dateOfBirth = NSDate(timeIntervalSinceNow: 0)
                profile.city = "Houston"
                profile.state = "Texas"
                profile.pincode = "74193"
                profile.country = "USA"
                profile.mobile = "+1-1111-111-111"
                profile.homeLandLine = "+1-2222-222-222"
                profile.officeLandLine = "+1-33333-333-333"
                user.profile = profile
                
                self.userService?.createOrUpdateProfile(user, completionBlock: { (success, response, exception) -> Void in
                    
                    if(success)
                    {
                        let updatedUser = response as! User
                        NSLog("User Name = %@", updatedUser.userName)
                        NSLog("First Name = %@", updatedUser.profile.firstName)
                        NSLog("Sex = %@", updatedUser.profile.sex)
                        NSLog("Date Of Birth = %@", updatedUser.profile.dateOfBirth)
                        NSLog("City = %@", updatedUser.profile.city)
                        NSLog("state = %@", updatedUser.profile.state)
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
            else
            {
                NSLog("%@", exception.reason!)
                NSLog("%d", exception.appErrorCode)
                NSLog("%d", exception.httpErrorCode)
                NSLog("%@", exception.userInfo!)
            }
        })
        
    }
    
    func assignRoles()
    {
        NSLog("Assign Roles")
        let userName = "HimanshusShephertz23123234"
        let roles = ["COO","Lead"]
        userService?.assignRoles(userName, roleList: roles, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
                let roles = user.roleList as! [String]
                for role in roles{
                    NSLog("%@",role)
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
    
    func getUser()
    {
        NSLog("getUser")
        let userName = "Nick";
        let dbName = "jsonDocument2";
        let collectionName = "Test";
        App42API.setDbName(dbName);
        let key = "name"
        let value = "Nick"
        let query = QueryBuilder.buildQueryWithKey(key, value:value,andOperator:APP42_OP_EQUALS);
        userService?.setQuery(collectionName, metaInfoQuery: query)
        userService?.getUser(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
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
    
    func getUserByEmailId()
    {
        NSLog("getUserByEmailId")
        let emailAddress = "HimanshusShephertz@shephertz.com"
        userService?.getUserByEmailId(emailAddress, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
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
    
    func getUsersByRole()
    {
        NSLog("getUsersByRole")
        let role = "Lead"
        userService?.getUsersByRole(role, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let list = response as! NSArray
                for user in list {
                    NSLog("%@", user.userName)
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
    
    func getRolesByUser()
    {
        NSLog("getRolesByUser")
        let userName = "HimanshusShephertz"
        userService?.getRolesByUser(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
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
    
    func getAllUsers()
    {
        NSLog("Get All Users")
        userService?.getAllUsers({ (success, response, exception) -> Void in
            
            if(success)
            {
                let list  = response as! NSArray
                
                for user in list {
                    NSLog("UserName is %@", user.userName)
                    NSLog("%@", user.email)
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
    
    func getAllUsersWithAdvancedSearch()
    {
        let otherMeta = NSMutableDictionary()
        otherMeta.setObject("n", forKey:"like")
        App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        let userService = App42API.buildUserService() as? UserService
        userService?.otherMetaHeaders = otherMeta
        userService?.getAllUsers({ (success, response, exception) -> Void in
            if(success)
            {
                let userList  = response as! NSArray
                for user in userList {
                    NSLog("UserName is : %@", user.userName)
                    NSLog("EmailId is : %@", user.email)
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
    
    func getAllUserWithPaging()
    {
        NSLog("getAllUsers with paging")
        let max:Int32 = 10
        let offset:Int32 = 0
        userService?.getAllUsers(max , offset: offset , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let list  = response as! NSArray
                for user in list {
                    NSLog("%@", user.userName)
                    NSLog("%@", user.email)
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
    func getAllUsersCount()
    {
        NSLog("getAllUsersCount")
        userService?.getAllUsersCount( { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! App42Response
                NSLog("%@", user.strResponse)
                NSLog("%d", user.totalRecords)
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
    func getLockedUsers()
    {
        NSLog("getLockedUsers")
        userService?.getLockedUsers({ (success, response, exception) -> Void in
            
            if(success)
            {
                let list  = response as! NSArray
                for user in list {
                    NSLog("%@", user.userName)
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
    func getLockedUsersCount()
    {
        NSLog("getLockedUsersCount")
        userService?.getLockedUsersCount({ (success, response, exception) -> Void in
            
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
    func getLockedUsersWithPaging()
    {
        NSLog("getLockedUsers with paging")
        let max:Int32 = 10
        let offset:Int32 = 0
        userService?.getLockedUsers(max, offset: offset , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let list  = response as! NSArray
                for user in list {
                    NSLog("%@", user.userName)
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
    
    func getUsersByGroup()
    {
        let userName = "HimanshusShephertz23123234"
        let userList = [userName,"Nick"]
        App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        let userService = App42API.buildUserService() as? UserService
        userService?.getUsersByGroup(userList, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let userList  = response as! NSArray
                for user in userList {
                    NSLog("UserName is : %@", user.userName)
                    NSLog("EmailId is : %@", user.email)
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
    
    func revokeRole()
    {
        NSLog("revokeRole")
        let userName = "HimanshusShephertz"
        let role = "Lead"
        userService?.revokeRole(userName, role:role, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let response = response as! App42Response
                NSLog("%@", response.isResponseSuccess)
                NSLog("%@", response.strResponse)
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
    func revokeAllRoles()
    {
        NSLog("revokeAllRoles")
        let userName = "Nick";
        App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        let userService = App42API.buildUserService() as? UserService
        userService?.revokeAllRoles(userName, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response success is : %@", app42Response.isResponseSuccess)
                NSLog("Response String is %@", app42Response.strResponse)
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
    func lockUser()
    {
        NSLog("lockUser")
        let userName = "HimanshusShephertz"
        userService?.lockUser(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("UserName = %@", user.userName)
                NSLog("isAccountLocked = %d",user.isAccountLocked)
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
    func unlockUser()
    {
        NSLog("unlockUser")
        let userName = "HimanshusShephertz"
        userService?.unlockUser(userName, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
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
    
    func authenticateUser()
    {
        NSLog("authenticateUser")
        let userName = "HimanshusShephertz23123234"
        let pwd = "123456"
        userService?.authenticateUser(userName, password:pwd, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
                NSLog("%@", user.sessionId)
                self.sessionId = user.sessionId
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
    
    func getProfileWithAuthenticateUser()
    {
        NSLog("authenticateUser")
        let userName = "NickAtShephertz"
        let pwd = "123456"
        let otherMeta = NSMutableDictionary(object: "true", forKey: "userProfile")
        userService?.otherMetaHeaders = otherMeta
        userService?.authenticateUser(userName, password:pwd, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
                NSLog("%@", user.sessionId)
                self.sessionId = user.sessionId
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
    
    func logOut()
    {
        NSLog("logout")
        
        userService?.logout(self.sessionId, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("%@", app42Response.isResponseSuccess)
                NSLog("%@", app42Response.strResponse)
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
    
    func changeUserPassword()
    {
        NSLog("changeUserPassword")
        let userName = "HimanshusShephertz"
        let oldPassword = "123456"
        let newPassword = "1234567"
        userService?.changeUserPassword(userName , oldPassword:oldPassword, newPassword:newPassword, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! App42Response
                NSLog("%@", user.isResponseSuccess)
                NSLog("%@", user.strResponse)
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
    
    func resetUserPassword()
    {
        NSLog("changeUserPassword")
        let userName = "HimanshusShephertz"
        userService?.resetUserPassword(userName , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! App42Response
                NSLog("%@", user.isResponseSuccess)
                NSLog("%@", user.strResponse)
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
    
    func resetUserPasswordWithCustomName()
    {
        let userName = "Nick";
        let otherMeta = NSMutableDictionary()
        otherMeta.setObject("John", forKey:"customName")
        App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        let userService = App42API.buildUserService() as? UserService
        userService?.otherMetaHeaders = otherMeta
        userService?.resetUserPassword(userName , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response success is : %@", app42Response.isResponseSuccess)
                NSLog("Response String is %@", app42Response.strResponse)
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
    
    func resetUserPasswordWithEmailVerification()
    {
        let userName = "Nick";
        let otherMeta = NSMutableDictionary(object: "true", forKey: "emailVerification")
        App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        let userService = App42API.buildUserService() as? UserService
        userService?.otherMetaHeaders = otherMeta
        userService?.resetUserPassword(userName , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let app42Response = response as! App42Response
                NSLog("Response success is : %@", app42Response.isResponseSuccess)
                NSLog("Response String is %@", app42Response.strResponse)
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
    
    func deleteUser()
    {
        NSLog("deleteUser")
        let userName = "HimanshusShephertz"
        userService?.deleteUser(userName , completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let user = response as! App42Response
                NSLog("%@", user.isResponseSuccess)
                NSLog("%@", user.strResponse)
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
    
    func getUsersByProfileData()
    {
        NSLog("getUsersByProfileData")
        let profile:Profile = Profile();
        profile.firstName = "Nick"
        userService?.getUsersByProfileData(profile, completionBlock: { (success, response, exception) -> Void in
            
            if(success)
            {
                let list = response as! [User]
                for user in list {
                    NSLog("%@", user.userName)
                    NSLog("First Name = %@", user.profile.firstName)
                    NSLog("Sex = %@", user.profile.sex)
                    NSLog("Date Of Birth = %@", user.profile.dateOfBirth)
                    NSLog("City = %@", user.profile.city)
                    NSLog("state = %@", user.profile.state)
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
    
    func getUsersBySpecificProfileData()
    {
        NSLog("getUsersByProfileData")
        let profile:Profile = Profile();
        profile.firstName = "Nick"
        profile.lastName = "Gill"
        let otherMeta = NSMutableDictionary(object:"true", forKey:"userProfile")
        userService?.otherMetaHeaders = otherMeta
        userService?.getUsersByProfileData(profile, completionBlock:{ (success, response, exception) -> Void in
            
            if(success)
            {
                let list = response as! [User]
                for user in list {
                    NSLog("%@", user.userName)
                    NSLog("First Name = %@", user.profile.firstName)
                    NSLog("Sex = %@", user.profile.sex)
                    NSLog("Date Of Birth = %@", user.profile.dateOfBirth)
                    NSLog("City = %@", user.profile.city)
                    NSLog("state = %@", user.profile.state)
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