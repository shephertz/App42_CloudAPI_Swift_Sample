//
//  ViewController.swift
//  App42APISwiftSample
//
//  Created by Rajeev Ranjan on 16/12/14.
//  Copyright (c) 2014 Rajeev Ranjan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var api_key = "cad2bfab6310acd9696187b98682925125e469ab0d0d585db0b00609f461b791"
        var secret_key = "55811709916e7ce4405cde0cdc5a254cf4b506fbafdae05760a73100b8080b67"
        App42API.initializeWithAPIKey(api_key, andSecretKey: secret_key)
        
        var userService:UserService = App42API.buildUserService() as UserService
        userService.createUser("Rajeev123456", password: "12345678", emailAddress: "rajeev.ranjan12856@shephertz.com") { (success, response, exception) -> Void in
            if(success)
            {
                var user = response as User
                NSLog("%@", user.userName)
                NSLog("%@", user.email)
            }
            else
            {
                NSLog("%@", exception.reason!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

