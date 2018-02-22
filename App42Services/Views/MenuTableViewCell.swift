//
//  MenuTableViewCell.swift
//  App42Services
//
//  Created by Purnima Singh on 07/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//

import UIKit

open class MenuTableViewCell: UITableViewCell {
    
    class var identifier: String { return String.className(self) }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    open override func awakeFromNib() {
    }
    
    open func setup() {
    }
    
    open class func height() -> CGFloat {
        return 48
    }
    
    open func setData(_ data: Any?) {
        self.backgroundColor = UIColor.white
        self.textLabel?.font = UIFont.init(name: "Montserrat-Light.ttf", size: 15.0)
        self.textLabel?.textColor = UIColor.black
        if let menuText = data as? String {
            self.textLabel?.text = menuText
        }
}
    
    open func setImageData(_ data: Any?)
    {
        if let menuImage = data as? String {
            self.imageView?.image = UIImage(named: menuImage)
        }
    }
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    
    // ignore the default handling
    override open func setSelected(_ selected: Bool, animated: Bool) {
    }
    
}
