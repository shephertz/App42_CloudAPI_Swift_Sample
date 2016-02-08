//
//  CartServiceAPI.swift
//  App42APISwiftSample
//
//  Created by Shephertz on 30/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

import UIKit

class CartServiceAPI: UITableViewController {

    var apiList:NSArray? = nil
    let cartService = App42API.buildCartService() as? CartService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cart Service"
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
        if cellText == "CreateCart"
        {
            createCart()
        }
        else if cellText == "GetCartDetails"
        {
           getCartDetails()
        }
        else if cellText == "AddItem"
        {
            addItem()
        }
        else if cellText == "GetItems"
        {
            getItems()
        }
        else if cellText == "GetItem"
        {
            getItem()
        }
        else if cellText == "IsEmpty"
        {
            isEmpty()
        }
        else if cellText == "CheckOut"
        {
            checkOut()
        }
        else if cellText == "Payment"
        {
            payment()
        }
        else if cellText == "GetPaymentsByUser"
        {
            getPaymentsByUser()
        }
        else if cellText == "GetPaymentByCart"
        {
            getPaymentByCart()
        }
        else if cellText == "GetPaymentsByStatus"
        {
            getPaymentsByStatus()
        }
        else if cellText == "GetPaymentsByUserAndStatus"
        {
            getPaymentsByUserAndStatus()
        }
        else if cellText == "GetPaymentHistoryByUser"
        {
            getPaymentHistoryByUser()
        }
        else if cellText == "GetPaymentHistoryAll"
        {
            getPaymentHistoryAll()
        }
        else if cellText == "IncreaseQuantity"
        {
            increaseQuantity()
        }
        else if cellText == "DecreaseQuantity"
        {
            decreaseQuantity()
        }
        else if cellText == "Removeitem"
        {
            removeitem()
        }
    }
   func createCart()
    {
        let userName = "Nick"
        //App42API.initializeWithAPIKey(@"API_KEY" andSecretKey:@"SECRET_KEY")
        //var cartService = App42API.buildCartService() as? CartService
        cartService?.createCart(userName, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            NSLog("Cart Session is : %@",cart.cartSession)
            NSLog("CreationTime is : %@",cart.creationTime)
            NSLog("UserName is : %@",cart.userName)
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
    func getCartDetails()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
       // App42API.initializeWithAPIKey("API_KEY" andSecretKey:"SECRET_KEY")
       // var cartService = App42API.buildCartService() as? CartService
        cartService?.getCartDetails(cartId, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("UserName is : %@",cart.userName)
            NSLog("CartId is : %@",cart.state)
            NSLog("CreationTime is : %@",cart.creationTime)
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
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
        let itemID = "111"
        let itemQuantity:Int32 = 12
        let price = 1000.00
       // App42API.initializeWithAPIKey(@"API_KEY" andSecretKey:@"SECRET_KEY")
       // var cartService = App42API.buildCartService() as? CartService
        cartService?.addItem(cartId, itemID:itemID, itemQuantity:itemQuantity, price:price, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            let itemList = cart.itemListArray
            for item in itemList
            {
                NSLog("ItemId is : %@", item.itemId)
                NSLog("Price is : %d", item.price)
                NSLog("Quantity is : %d", item.quantity)
                NSLog("Total Amount is : %d", item.totalAmount)
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
        //NSDecimalNumber num = 1.0
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let cartService = App42API.buildCartService() as? CartService
        cartService?.getItems(cartId, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            let itemList = cart.itemListArray
            for item in itemList
            {
                NSLog("ItemId is : %@", item.itemId)
                let price = item.price as NSDecimalNumber
                NSLog("Price is : %d", price.intValue)
                NSLog("Quantity is : %d", item.quantity)
                NSLog("Total Amount is : %lf", item.totalAmount)
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
    
    func getItem()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
        let itemId = "111"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.getItem(cartId, itemId:itemId, completionBlock: { (success, response, exception) -> Void in
            if(success)
            {
                let cart = response as! Cart
                NSLog("CartId is : %@",cart.cartId)
                let itemList = cart.itemListArray
                for item in itemList
                {
                    NSLog("ItemId is : %@", item.itemId)
                    let price = item.price as NSDecimalNumber
                    NSLog("Price is : %d", price.intValue)
                    NSLog("Quantity is : %d", item.quantity)
                    NSLog("Total Amount is : %lf", item.totalAmount)
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
    func isEmpty()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //var cartService = App42API.buildCartService() as? CartService
        cartService?.isEmpty(cartId, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
        let cart = response as! Cart
        NSLog("CartId is : %@",cart.cartId)
        NSLog("Is Empty : %@",cart.isEmpty)
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
    
    func checkOut()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //var cartService = App42API.buildCartService() as? CartService
        cartService?.checkOut(cartId, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            NSLog("Is Empty : %@",cart.isEmpty)
            NSLog("State : %@",cart.state)

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
    
    func payment()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
        let transactionID = "transactionID"
        let paymentStatus = "AUTHORIZED"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.payment(cartId, transactionID:transactionID, paymentStatus:paymentStatus, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            let payment = cart.paymentObj as Payment!
            NSLog("Transaction Id : %@",payment.transactionId)
            NSLog("Total Amount from payment node : %d",payment.totalAmount)
            NSLog("Status : %@",payment.status)
            NSLog("Date : %@",payment.date)
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
    func getPaymentsByUser()
    {
        let username = "Nick"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.getPaymentsByUser(username, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cartList = response as! NSArray
            for cart in cartList
            {
                NSLog("CartId is : %@",cart.cartId)
                let payment = cart.paymentObj as! Payment
                NSLog("Transaction Id : %@",payment.transactionId)
                NSLog("Total Amount from payment node : %lf",payment.totalAmount)
                NSLog("Status : %@",payment.status)
                NSLog("Date : %@",payment.date)
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
    
   func getPaymentByCart()
    {
        let cartID = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
     //   App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
      //  let cartService = App42API.buildCartService() as? CartService
        cartService?.getPaymentByCart(cartID, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            let payment = cart.paymentObj as! Payment
            NSLog("Transaction Id : %@",payment.transactionId)
            NSLog("Total Amount from payment node : %lf",payment.totalAmount)
            NSLog("Status : %@",payment.status)
            NSLog("Date : %@",payment.date)
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
    func getPaymentsByUserAndStatus()
    {
        let username = "Nick"
        let paymentStatus = "AUTHORIZED"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.getPaymentsByUserAndStatus(username, status:paymentStatus, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
        let cartList = response as! NSArray
        for cart in cartList
        {
            NSLog("CartId is : %@",cart.cartId)
            let payment = cart.paymentObj as! Payment
            NSLog("Transaction Id : %@",payment.transactionId)
            NSLog("Total Amount from payment node : %d",payment.totalAmount)
            NSLog("Status : %@",payment.status)
            NSLog("Date : %@",payment.date)
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
    func getPaymentsByStatus()
    {
        let paymentStatus = "AUTHORIZED"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //var cartService = App42API.buildCartService() as? CartService
        cartService?.getPaymentsByStatus(paymentStatus, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cartList = response as! NSArray
            for cart in cartList {
            NSLog("CartId is : %@",cart.cartId)
            let payment = cart.paymentObj as Payment
            NSLog("Transaction Id : %@",payment.transactionId)
            NSLog("Total Amount from payment node : %d",payment.totalAmount)
            NSLog("Status : %@",payment.status)
            NSLog("Date : %@",payment.date)
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
    
    func getPaymentHistoryByUser()
    {
        let username = "Nick"
      //  App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.getPaymentHistoryByUser(username, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cartList = response as! NSArray
            for cart in cartList
            {
                NSLog("CartId is : %@",cart.cartId)
                let payment = cart.paymentObj as Payment
                NSLog("Transaction Id : %@",payment.transactionId)
                NSLog("Total Amount from payment node : %d",payment.totalAmount)
                NSLog("Status : %@",payment.status)
                NSLog("Date : %@",payment.date)
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
    func getPaymentHistoryAll()
    {
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
       // let cartService = App42API.buildCartService() as? CartService
        cartService?.getPaymentHistoryAll({ (success, response, exception) -> Void in
        if(success)
        {
            let cartList = response as! NSArray
            for cart in cartList {
            NSLog("CartId is : %@",cart.cartId)
            let payment = cart.paymentObj as Payment
            NSLog("Transaction Id : %@",payment.transactionId)
            NSLog("Total Amount from payment node : %d",payment.totalAmount)
            NSLog("Status : %@",payment.status)
            NSLog("Date : %@",payment.date)
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
    
    func increaseQuantity()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
        let itemID = "111"
        let itemQuantity:Int32 = 12
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.increaseQuantity(cartId, itemID:itemID, itemQuantity:itemQuantity, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            let itemList = cart.itemListArray
            for item in itemList
            {
            NSLog("ItemId is : %@", item.itemId)
            let price = item.price as NSDecimalNumber
            NSLog("Price is : %d", price.intValue)
            NSLog("Quantity is : %d", item.quantity)
            NSLog("Total Amount is : %d", item.totalAmount)
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
    func decreaseQuantity()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
        let itemID = "111"
        let itemQuantity:Int32 = 10
        //App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.decreaseQuantity(cartId, itemID:itemID, itemQuantity:itemQuantity, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
            let cart = response as! Cart
            NSLog("CartId is : %@",cart.cartId)
            let itemList = cart.itemListArray
            for item in itemList
            {
            NSLog("ItemId is : %@", item.itemId)
            let price = item.price as NSDecimalNumber
            NSLog("Price is : %d", price.intValue)
            NSLog("Quantity is : %d", item.quantity)
            NSLog("Total Amount is : %d", item.totalAmount)
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
    func removeitem()
    {
        let cartId = "5aad9293d50e232e70b283e3a059a6727b48f595b9f9828ee9f4ee3b8db53e3c"
        let itemID = "111"
       // App42API.initializeWithAPIKey("API_KEY", andSecretKey:"SECRET_KEY")
        //let cartService = App42API.buildCartService() as? CartService
        cartService?.removeItem(cartId,itemId: itemID, completionBlock: { (success, response, exception) -> Void in
        if(success)
        {
        let app42Response = response as! App42Response
        NSLog("App42Response is : %@", app42Response.strResponse)
        NSLog("IsResponseSuccess : %@", app42Response.isResponseSuccess)
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
