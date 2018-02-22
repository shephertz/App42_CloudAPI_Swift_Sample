//
//  SHUsersViewController.swift
//  App42Services
//
//  Created by Purnima Singh on 07/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//
// 616161 dark
// f7f7f7 light

import UIKit

class SHUsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var isFromMenu : Bool!
    var dataSource = [UsersTableViewCellContent]()
    var userService = App42API.buildUserService() as! UserService
    
    var registerLogString = ""
    var signinLogString = ""
    var getUserName = "purnima"
    var getUserResponse = ""
    
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFromMenu {
            self.setNavigationBarItem()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        
        self.view.backgroundColor = UIColor.black
        usersTableView.tableFooterView = UIView()
        usersTableView.separatorColor = UIColor_HexValue.init(hex: "636363")
        usersTableView.estimatedRowHeight = 60
        usersTableView.rowHeight = UITableViewAutomaticDimension
        usersTableView.separatorInset = .zero
        usersTableView.layoutMargins = .zero
        
        dataSource = [UsersTableViewCellContent.init(title: "Register"), UsersTableViewCellContent.init(title: "Sign In"), UsersTableViewCellContent.init(title: "Get User")]
        
        NotificationCenter.default.addObserver(self, selector: #selector(SHUsersViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SHUsersViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath) as! UsersTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.black
        cell.set(content: dataSource[indexPath.row])
        
        cell.getUsernameTextField.text = getUserName
        
        cell.inputButton.addTarget(self, action: #selector(SHUsersViewController.registerInputButtonClick(sender:)), for: .touchUpInside)
        cell.responseButton.addTarget(self, action: #selector(SHUsersViewController.registerResponseButtonClick(sender:)), for: .touchUpInside)
        cell.submitButton.addTarget(self, action: #selector(SHUsersViewController.registerSubmitButtonClick(sender:)), for: .touchUpInside)
        
        cell.signinInputButton.addTarget(self, action: #selector(SHUsersViewController.signinInputButtonClick(sender:)), for: .touchUpInside)
        cell.signinRespinseButton.addTarget(self, action: #selector(SHUsersViewController.signinResponseButtonClick(sender:)), for: .touchUpInside)
        cell.signinSubmitButton.addTarget(self, action: #selector(SHUsersViewController.signinSubmitButtonClick(sender:)), for: .touchUpInside)
        
        cell.getUserInputButton.addTarget(self, action: #selector(SHUsersViewController.getUserInputButtonClick(sender:)), for: .touchUpInside)
        cell.getUserResponseButton.addTarget(self, action: #selector(SHUsersViewController.getUserResponseButtonClick(sender:)), for: .touchUpInside)
        cell.getUserSubmitButton.addTarget(self, action: #selector(SHUsersViewController.getUserSubmitButtonClick(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let content = dataSource[indexPath.row]
        if content.title == "Register" {
            if content.expanded {
                return 310
            }
        }
        else if content.title == "Sign In" {
            if content.expanded {
                return 260
            }
        }
        else if content.title == "Get User" {
            if content.expanded {
                return 280
            }
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.hideKeyboardOnClick()
        
        let content = dataSource[indexPath.row]

        guard (tableView.cellForRow(at: indexPath) as? UsersTableViewCell) != nil
            else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            tableView.beginUpdates()
            content.expanded = !content.expanded
            tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.none, animated: true)
            tableView.endUpdates()
            
        })
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let content = dataSource[indexPath.row]
        
        guard (tableView.cellForRow(at: indexPath) as? UsersTableViewCell) != nil
            else { return }
        UIView.animate(withDuration: 0.3, animations: {
            tableView.beginUpdates()
            content.expanded = false
            tableView.endUpdates()
        })
    }
    
//    func tableView(_tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//
//        if cell.respondsToSelector("setSeparatorInset:") {
//            cell.separatorInset = UIEdgeInsetsZero
//        }
//        if cell.respondsToSelector("setLayoutMargins:") {
//            cell.layoutMargins = UIEdgeInsetsZero
//        }
//        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
//            cell.preservesSuperviewLayoutMargins = false
//        }
//    }
    
    @objc func registerInputButtonClick(sender : UIButton) {
        self.hideKeyboardOnClick()
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        print(indexPath.row)
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        cell.inputButton.isSelected = true
        cell.responseButton.isSelected = false
        cell.inputButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        cell.responseButton.backgroundColor = UIColor_HexValue.init(hex: "616161")

        cell.nameTextField.isHidden = false
        cell.passwordTextField.isHidden = false
        cell.emailTextField.isHidden = false
        cell.submitButton.isHidden = false
        cell.responseTextView.isHidden = true
    }
    
    @objc func registerResponseButtonClick(sender : UIButton) {
        self.hideKeyboardOnClick()
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        
        cell.inputButton.isSelected = false
        cell.responseButton.isSelected = true
        cell.inputButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        cell.responseButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        
        cell.nameTextField.isHidden = true
        cell.passwordTextField.isHidden = true
        cell.emailTextField.isHidden = true
        cell.submitButton.isHidden = true
        cell.responseTextView.isHidden = false
    }
    
    @objc func registerSubmitButtonClick(sender : UIButton) {
        
        self.hideKeyboardOnClick()

        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        let name = cell.nameTextField.text
        let email = cell.emailTextField.text
        let pass = cell.passwordTextField.text
        
        userService.createUser(name, password: pass, emailAddress: email) { (success, response, exception) in
            if(success)
            {
                let user = response as! User
                print("username : %@ : \(user.userName)")
                print("email : %@ : \(user.email)")
                print("session id : %@ : \(user.sessionId)")
                
                if self.registerLogString.count > 0 {
                    self.registerLogString = self.registerLogString + "\n\n\n" + "\(user.userName!)\n\(user.email!)\n\(user.sessionId!)"
                }
                else {
                    self.registerLogString = "\(user.userName!)\n\(user.email!)\n\(user.sessionId!)"
                }
                
                cell.responseTextView.text = self.registerLogString
                
            }
            else
            {
                print("\(String(describing: exception?.reason!))")
                print("\(String(describing:  exception?.appErrorCode))")
                print("\(String(describing: exception?.httpErrorCode))")
                print("\(String(describing: exception?.userInfo!))")
                
                let errorStr : String = exception?.userInfo!["details"] as! String
                self.showAlertView(message: errorStr)
            }
        }
    }
    
    @objc func signinInputButtonClick(sender : UIButton) {
        self.hideKeyboardOnClick()
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        print(indexPath.row)
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        cell.signinInputButton.isSelected = true
        cell.signinRespinseButton.isSelected = false
        cell.signinInputButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        cell.signinRespinseButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        
        cell.signInName.isHidden = false
        cell.signinPassword.isHidden = false
        cell.signinSubmitButton.isHidden = false
        cell.signinResponseTextView.isHidden = true
    }
    
    @objc func signinResponseButtonClick(sender : UIButton) {
        self.hideKeyboardOnClick()
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        
        cell.signinInputButton.isSelected = false
        cell.signinRespinseButton.isSelected = true
        cell.signinInputButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        cell.signinRespinseButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        
        cell.signInName.isHidden = true
        cell.signinPassword.isHidden = true
        cell.signinSubmitButton.isHidden = true
        cell.signinResponseTextView.isHidden = false
    }
    
    @objc func signinSubmitButtonClick(sender : UIButton) {
        self.hideKeyboardOnClick()
        
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        
        let username = cell.signInName.text
        let password = cell.signinPassword.text
        
        userService.authenticateUser(username, password: password) { (success, response, exception) in
            if(success)
            {
                let user = response as! User
                print("username : %@ : \(user.userName)")
                print("email : %@ : \(user.email)")
                print("session id : %@ : \(user.sessionId)")
                
                if self.signinLogString.count > 0 {
                    self.signinLogString = self.signinLogString + "\n\n\n" + "\(user.userName!)\n\(user.email!)\n\(user.sessionId!)"
                }
                else {
                    self.signinLogString = "\(user.userName!)\n\(user.email!)\n\(user.sessionId!)"
                }
                
                cell.signinResponseTextView.text = self.signinLogString
                
            }
            else
            {
                print("\(String(describing: exception?.reason!))")
                print("\(String(describing:  exception?.appErrorCode))")
                print("\(String(describing: exception?.httpErrorCode))")
                print("\(String(describing: exception?.userInfo!))")
             
                let errorStr : String = exception?.userInfo!["details"] as! String
                self.showAlertView(message: errorStr)
            }
        }
    }
    
    @objc func getUserInputButtonClick(sender : UIButton) {
        
        self.hideKeyboardOnClick()
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        cell.getUserSubmitButton.isHidden = false
        cell.getUsernameTextField.isHidden = false
        cell.getUserResponseTextView.isHidden = true
        
        cell.getUserInputButton.isSelected = true
        cell.getUserResponseButton.isSelected = false
        cell.getUserInputButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        cell.getUserResponseButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        
    }
    
    @objc func getUserResponseButtonClick(sender : UIButton) {
        
        self.hideKeyboardOnClick()
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        cell.getUserSubmitButton.isHidden = true
        cell.getUsernameTextField.isHidden = true
        cell.getUserResponseTextView.isHidden = false
        
        cell.getUserInputButton.isSelected = false
        cell.getUserResponseButton.isSelected = true
        cell.getUserInputButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        cell.getUserResponseButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        
        
        if self.getUserResponse.count > 0 {
            cell.getUserResponseTextView.text = self.getUserResponse
        }
        else {
            cell.getUserResponseTextView.text = "No Logs..."
        }
    }
    
    @objc func getUserSubmitButtonClick(sender : UIButton) {
        
        self.hideKeyboardOnClick()
        let point = self.usersTableView.convert(CGPoint.zero, from: sender)
        
        guard let indexPath = self.usersTableView.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
        
        let cell = self.usersTableView.cellForRow(at: indexPath) as! UsersTableViewCell
        let username = cell.getUsernameTextField.text
        
        userService.getUser(username) { (success, response, exception) in
            
              if(success)      {
                let user = response as! User
                NSLog("UserName is : %@", user.userName)
                NSLog("EmailId is : %@", user.email)
                
                if self.getUserResponse.count > 0 {
                    self.getUserResponse = self.signinLogString + "\n\n\n" + "\(user.userName!)\n\(user.email!)"
                }
                else {
                    self.getUserResponse = "\(user.userName!)\n\(user.email!)"
                }
                
                if cell.getUserResponseButton.isSelected {
                    cell.getUserResponseTextView.text = self.getUserResponse
                }
              }
              else
              {
                print("\(String(describing: exception?.reason!))")
                print("\(String(describing:  exception?.appErrorCode))")
                print("\(String(describing: exception?.httpErrorCode))")
                print("\(String(describing: exception?.userInfo!))")
                
                let errorStr : String = exception?.userInfo!["details"] as! String
                self.showAlertView(message: errorStr)
            }
            
            
        }
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.usersTableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    @objc func keyboardWillHide(_ notification:Notification) {
        
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            self.usersTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    
    func showAlertView(message : String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                print("ok")
            }
            alertController.addAction(yesAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func hideKeyboardOnClick() {
        self.view.endEditing(true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
