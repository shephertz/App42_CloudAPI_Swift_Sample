//
//  SHStorageViewController.swift
//  App42Services
//
//  Created by Purnima Singh on 07/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//

import UIKit

class SHStorageViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var stoargeScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var uploadView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var logsButton: UIButton!
    @IBOutlet weak var fetchView: UIView!
    @IBOutlet weak var fetchJsonButton: UIButton!
    @IBOutlet weak var fetchLogsButton: UIButton!
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var uploadJsonButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var editTextView: UITextView!
    @IBOutlet weak var fetchJsonTextView: UITextView!
    @IBOutlet weak var resetUploadLogsButton: UIButton!
    
    var isFromMenu : Bool!
    var stoargeService = App42API.buildStorageService() as! StorageService
    let noLogsText = "No logs..."
    var uploadJsonString = ""
    var uploadLogsString = ""
    
    var fetchInputString = ""
    var fetchLogsString = ""
    
    let dbName = "IOSDB"
    let collectionName = "uploadJson"
    var findKey = "name"
    var findValue = "purnima"
    
//    var resetButtonRect : CGRect!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFromMenu {
            self.setNavigationBarItem()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Storage"
        
        self.view.backgroundColor = UIColor.black
        
        self.contentView.backgroundColor = UIColor.black
        
        self.uploadView.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.uploadView.layer.cornerRadius = 10.0
        self.uploadView.layer.masksToBounds = true
        
        self.editButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.editButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.editButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.editButton.setTitle("Input", for: .normal)
        
        self.logsButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        self.logsButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.logsButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.logsButton.setTitle("Response", for: .normal)

        self.uploadJsonButton.backgroundColor = UIColor_HexValue.init(hex: "d5d5d5")
        self.uploadJsonButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        
        self.resetButton.backgroundColor = UIColor_HexValue.init(hex: "d5d5d5")
        self.resetButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        
        self.resetUploadLogsButton.backgroundColor = UIColor_HexValue.init(hex: "d5d5d5")
        self.resetUploadLogsButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        self.resetUploadLogsButton.isHidden = true
        self.resetUploadLogsButton.setTitleColor(UIColor.white, for: .highlighted)
        
        self.fetchView.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.fetchView.layer.cornerRadius = 10.0
        self.fetchView.layer.masksToBounds = true
        
        self.fetchJsonButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.fetchJsonButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.fetchJsonButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.fetchJsonButton.setTitle("Input", for: .normal)
        
        self.fetchLogsButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        self.fetchLogsButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.fetchLogsButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.fetchLogsButton.setTitle("Response", for: .normal)
        
        self.fetchButton.backgroundColor = UIColor_HexValue.init(hex: "d5d5d5")
        self.fetchButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        self.fetchButton.setTitle("Find", for: .normal)
        
        self.editButton.isSelected = true
        self.fetchJsonButton.isSelected = true
        
        self.editTextView.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.editTextView.textColor = UIColor_HexValue.init(hex: "666666")
        self.editTextView.tintColor = UIColor.darkGray
        self.editTextView.isEditable = true
        
        self.fetchJsonTextView.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.fetchJsonTextView.textColor = UIColor_HexValue.init(hex: "666666")
        self.fetchJsonTextView.tintColor = UIColor.darkGray
        
        uploadJsonString = "{\"name\" :  \"purnima\",\n\"comapny\" : \"Shephertz\"}"
        editTextView.text = uploadJsonString
        editTextView.delegate = self
        
        self.fetchJsonTextView.delegate = self
        fetchInputString = "key = \(findKey)\nValue = \(findValue)"
        self.fetchJsonTextView.text = fetchInputString
        
        NotificationCenter.default.addObserver(self, selector: #selector(SHUsersViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SHUsersViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func editButtonClick(_ sender: Any) {
        
        self.hideKeboardOnClick()
        self.editButton.isSelected = true
        self.logsButton.isSelected = false
        self.editButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.logsButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        
        uploadJsonButton.isHidden = false
        resetButton.isHidden = false
        self.resetUploadLogsButton.isHidden = true

        self.editTextView.text = uploadJsonString
        self.editTextView.isEditable = true

    }
    
    @IBAction func logsButtonClick(_ sender: Any) {
        
        self.hideKeboardOnClick()
        self.editButton.isSelected = false
        self.logsButton.isSelected = true
        self.logsButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.editButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        
        uploadJsonButton.isHidden = true
        resetButton.isHidden = true
        self.resetUploadLogsButton.isHidden = false
        
        if uploadLogsString.count == 0 {
            editTextView.text = noLogsText
        }
        else {
            editTextView.text = uploadLogsString
        }
        self.editTextView.isEditable = false
        self.editTextView.resignFirstResponder()
    }
    
    @IBAction func uploadButtonClick(_ sender: Any) {

        self.hideKeboardOnClick()
        uploadJsonString = self.editTextView.text
        print("upload json string: \(uploadJsonString)")
        if uploadJsonString.count > 0 {
            stoargeService.insertJSONDocument(dbName, collectionName: collectionName, json: uploadJsonString) { (success, response, exception) in
                
                if(success)      {
                    let storage = response as! Storage
                    NSLog("dbName is : %@", storage.dbName)
                    NSLog("collectionName is : %@", storage.collectionName)
                    let jsonDocList = storage.jsonDocArray
                    
                    for jsonDoc in jsonDocList! {
                        print("Docid is : \((jsonDoc as AnyObject).docId)")
                        print("CreatedAt is : \((jsonDoc as AnyObject).createdAt)")
                        print("UpdatedAt is : \((jsonDoc as AnyObject).updatedAt)")
                        print("JsonDoc is : \((jsonDoc as AnyObject).jsonDoc!)")
                        
                        if self.uploadLogsString.count > 0 {
                            self.uploadLogsString = self.uploadLogsString + "\n\n\n" + (jsonDoc as AnyObject).jsonDoc!
                        }
                        else {
                            self.uploadLogsString = (jsonDoc as AnyObject).jsonDoc!
                        }
                        
                        if self.logsButton.isSelected {
                            self.editTextView.text = self.uploadLogsString
                        }
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
        else {
            self.showAlertView(message: "Please enter valid json to upload")
        }
    }
    
    @IBAction func resetButtonClick(_ sender: Any) {
        
        self.hideKeboardOnClick()
        uploadJsonString = ""
        self.editTextView.text = uploadJsonString
    }
    
    @IBAction func fetchJsonButtonClick(_ sender: Any) {
        
        self.hideKeboardOnClick()
        self.fetchButton.setTitle("Find", for: .normal)
        
        self.fetchJsonButton.isSelected = true
        self.fetchLogsButton.isSelected = false
        
        self.fetchJsonButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.fetchLogsButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        fetchButton.isHidden = false
        
        self.fetchJsonTextView.text = fetchInputString
    }
    
    @IBAction func fetchLogsButtonClick(_ sender: Any) {
        
        self.hideKeboardOnClick()
        self.fetchButton.setTitle("Clear Response", for: .normal)
        
        self.fetchJsonButton.isSelected = false
        self.fetchLogsButton.isSelected = true
        
        self.fetchLogsButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.fetchJsonButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        
        
        if fetchLogsString.count == 0 {
            self.fetchJsonTextView.text = noLogsText
        }
        else {
            self.fetchJsonTextView.text = fetchLogsString
        }
        
    }
    
    
    @IBAction func fetchButtonClick(_ sender: UIButton) {
        
        self.hideKeboardOnClick()
        self.fetchButton.isHighlighted = true

        if sender.currentTitle == "Find" {
            findDocumentsFromQuery()
        }
        else {
            
            self.fetchLogsString = noLogsText 
            self.fetchJsonTextView.text = self.fetchLogsString
        }
        
        /*
        let url = Bundle.main.url(forResource: "Sample", withExtension: "json")
        let data = try! Data.init(contentsOf: url!);
        let jsonString = "{\"two\": 2, \"five\": 50, \"one\": 10,\"three\": 30,\"four\": 4,\"six\": 6}"
       
        
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                print(dictionary)
                
                findKey = "one"
                findValue = "1"
                stoargeService.saveOrUpdateDocument(byKeyValue: dbName, collectionName: collectionName, key: findKey, value: findValue, newJsonDoc: jsonString, completionBlock: { (success, response, exception) in
                    if(success)      {
                        let storage = response as! Storage
                        print("dbName is : \(storage.dbName)")
                        print("collectionName is : \(storage.collectionName)")
                        let jsonDocList = storage.jsonDocArray
                        for jsonDoc in jsonDocList! {
                            print("Docid is : %@",(jsonDoc as AnyObject).docId)
                            print("CreatedAt is : %@",(jsonDoc as AnyObject).createdAt)
                            print("UpdatedAt is : %@",(jsonDoc as AnyObject).updatedAt)
                            print("JsonDoc is : %@",(jsonDoc as AnyObject).jsonDoc)
                            
                        }
                        
                    }
                    else
                    {
                        print("\(String(describing: exception?.reason!))")
                        print("\(String(describing:  exception?.appErrorCode))")
                        print("\(String(describing: exception?.httpErrorCode))")
                        print("\(String(describing: exception?.userInfo!))")
                    }
                })
                
            }
        } catch {
            // Handle Error
        }*/
        
    
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if textView == self.editTextView {
            if self.editButton.isSelected {
                self.uploadJsonString = textView.text
            }
        }
        
        return true
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
    
    func findDocumentsFromQuery() {
        
        self.hideKeboardOnClick()
        let storageService = App42API.buildStorageService() as? StorageService
        let query = QueryBuilder.buildQuery(withKey: findKey, value: findValue, andOperator:APP42_OP_EQUALS)
        storageService?.findDocuments(by: query, dbName: dbName, collectionName: collectionName, completionBlock: { (success, response, exception) -> Void in
            if(success)      {
                let storage = response as! Storage
                NSLog("dbName is : %@", storage.dbName)
                NSLog("collectionName is : %@", storage.collectionName)
                let jsonDocList = storage.jsonDocArray
                for jsonDoc in jsonDocList! {
                    print("Docid is : \((jsonDoc as AnyObject).docId)")
                    print("CreatedAt is : \((jsonDoc as AnyObject).createdAt)")
                    print("UpdatedAt is : \((jsonDoc as AnyObject).updatedAt)")
                    print("JsonDoc is : \((jsonDoc as AnyObject).jsonDoc)")
                    
                    if self.fetchLogsString.count > 0 {
                        self.fetchLogsString = self.fetchLogsString + "\n\n\n" + (jsonDoc as AnyObject).jsonDoc!
                    }
                    else {
                        self.fetchLogsString = (jsonDoc as AnyObject).jsonDoc!
                    }
                    
                    if self.fetchLogsButton.isSelected {
                        self.fetchJsonTextView.text = self.fetchLogsString
                    }

                }
                
            }
            else      {
                print("\(String(describing: exception?.reason!))")
                print("\(String(describing:  exception?.appErrorCode))")
                print("\(String(describing: exception?.httpErrorCode))")
                print("\(String(describing: exception?.userInfo!))")
                
                let errorStr : String = exception?.userInfo!["details"] as! String
                self.showAlertView(message: errorStr)
                
            }
            
        })
    }
    
    @IBAction func clearButtonClick(_ sender: UIButton) {
        sender.isHighlighted = true
        self.uploadLogsString = ""
        self.editTextView.text = self.noLogsText
    }
    
    func hideKeboardOnClick() {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.stoargeScrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    @objc func keyboardWillHide(_ notification:Notification) {
        
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            self.stoargeScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }
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
