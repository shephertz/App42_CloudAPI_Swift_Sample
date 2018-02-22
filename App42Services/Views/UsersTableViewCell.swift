//
//  UsersTableViewCell.swift
//  App42Services
//
//  Created by Purnima Singh on 13/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//

import UIKit

class UsersTableViewCellContent {
    var title: String?
    var expanded: Bool
    
    init(title: String) {
        self.title = title
        self.expanded = false
    }
}



class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var responseButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var responseTextView: UITextView!
    
    @IBOutlet weak var signinBackView: UIView!
    @IBOutlet weak var signinInputButton: UIButton!
    @IBOutlet weak var signinRespinseButton: UIButton!
    @IBOutlet weak var signInName: UITextField!
    @IBOutlet weak var signinPassword: UITextField!
    @IBOutlet weak var signinSubmitButton: UIButton!
    @IBOutlet weak var signinResponseTextView: UITextView!
    
    @IBOutlet weak var getUserBackView: UIView!
    @IBOutlet weak var getUserInputButton: UIButton!
    @IBOutlet weak var getUserResponseButton: UIButton!
    @IBOutlet weak var getUserResponseTextView: UITextView!
    @IBOutlet weak var getUserSubmitButton: UIButton!
    @IBOutlet weak var getUsernameTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        self.backgroundColor = UIColor.black
        self.headerLabel.backgroundColor = UIColor.clear
        self.headerLabel.textColor = UIColor.white
        self.headerLabel.font = UIFont.init(name: "Montserrat-Thin.ttf", size: 18.0)
        
        
        self.backView.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.backView.layer.cornerRadius = 10.0
        self.backView.layer.masksToBounds = true
        
        
        self.inputButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.inputButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.inputButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.inputButton.setTitle("Input", for: .normal)
        
        self.responseButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        self.responseButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.responseButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.responseButton.setTitle("Response", for: .normal)
        
        self.submitButton.backgroundColor = UIColor_HexValue.init(hex: "d5d5d5")
        self.submitButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        
        self.signinBackView.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.signinBackView.layer.cornerRadius = 10.0
        self.signinBackView.layer.masksToBounds = true
        
        self.signinInputButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.signinInputButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.signinInputButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.signinInputButton.setTitle("Input", for: .normal)
        
        self.signinRespinseButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        self.signinRespinseButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.signinRespinseButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.signinRespinseButton.setTitle("Response", for: .normal)
        
        self.signinSubmitButton.backgroundColor = UIColor_HexValue.init(hex: "d5d5d5")
        self.signinSubmitButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        
        self.responseTextView.isHidden = true
        self.responseTextView.text = "No Logs..."
        self.responseTextView.isEditable = false
        self.responseTextView.isSelectable = false
        
        self.signinResponseTextView.isHidden = true
        self.signinResponseTextView.text = "No Logs..."
        self.signinResponseTextView.isEditable = false
        self.signinResponseTextView.isSelectable = false
        
        self.getUserBackView.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.getUserBackView.layer.cornerRadius = 10.0
        self.getUserBackView.layer.masksToBounds = true
        
        self.getUserInputButton.backgroundColor = UIColor_HexValue.init(hex: "f7f7f7")
        self.getUserInputButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.getUserInputButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.getUserInputButton.setTitle("Input", for: .normal)
        
        self.getUserResponseButton.backgroundColor = UIColor_HexValue.init(hex: "616161")
        self.getUserResponseButton.setTitleColor(UIColor_HexValue.init(hex: "999999"), for: .normal)
        self.getUserResponseButton.setTitleColor(UIColor_HexValue.init(hex: "000000"), for: .selected)
        self.getUserResponseButton.setTitle("Response", for: .normal)
        
        self.getUserSubmitButton.backgroundColor = UIColor_HexValue.init(hex: "d5d5d5")
        self.getUserSubmitButton.setTitleColor(UIColor_HexValue.init(hex: "0042ff"), for: .normal)
        self.getUserSubmitButton.setTitleColor(UIColor.darkGray, for: .selected)
        
        self.getUserResponseTextView.isHidden = true
    }

    
    func set(content: UsersTableViewCellContent) {
        
        self.headerLabel.text = content.title
        
        if content.title == "Register" {
            self.signinBackView.isHidden = true
            self.backView.isHidden = false
            self.getUserBackView.isHidden = true
        }
        else if self.headerLabel.text == "Sign In" {
            self.backView.isHidden = true
            self.signinBackView.isHidden = false
            self.getUserBackView.isHidden = true
        }
        else {
            self.signinBackView.isHidden = true
            self.backView.isHidden = true
            self.getUserBackView.isHidden = false
            self.getUserResponseTextView.isHidden = true
        }
        
    }

}
