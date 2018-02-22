//
//  SHHomeViewController.swift
//  App42Services
//
//  Created by Purnima Singh on 06/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//

import UIKit

class SHHomeViewController: UIViewController {

    @IBOutlet weak var shephertzLogoImage: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var pushBackView: UIView!
    @IBOutlet weak var pushImage: UIImageView!
    @IBOutlet weak var pushLABEL: UILabel!
    @IBOutlet weak var pushDescription: UILabel!
    @IBOutlet weak var storageView: UIView!
    @IBOutlet weak var storageImage: UIImageView!
    @IBOutlet weak var storageLabel: UILabel!
    @IBOutlet weak var storageDescription: UILabel!
    @IBOutlet weak var usersView: UIView!
    @IBOutlet weak var usersImage: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    
    var gradientLayer: CAGradientLayer!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        createPushGradientLayer()
        createStoargeGradientLayer()
        createUserGradientLayer()
        self.setNavigationBarItem()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.quoteLabel.font = UIFont.init(name: "Montserrat-Light", size: 18.0)

        self.pushBackView.isUserInteractionEnabled = true
        self.storageView.isUserInteractionEnabled = true
        self.usersView.isUserInteractionEnabled = true
        
        let pushTap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(SHHomeViewController.pushViewTap))
        pushTap.numberOfTapsRequired = 1
        self.pushBackView.addGestureRecognizer(pushTap)
    
        let stoargeTap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(SHHomeViewController.storageViewTap))
        stoargeTap.numberOfTapsRequired = 1
        self.storageView.addGestureRecognizer(stoargeTap)
        
        let usersTap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(SHHomeViewController.usersViewTap))
        usersTap.numberOfTapsRequired = 1
        self.usersView.addGestureRecognizer(usersTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createPushGradientLayer() {
        
        if let pushView = self.pushBackView {
            pushView.layer.cornerRadius = 8.0
            pushView.layer.masksToBounds = true
            
            gradientLayer = CAGradientLayer()
            
            
            gradientLayer.colors = [UIColor_HexValue.init(hex: "fe00b9").cgColor, UIColor_HexValue.init(hex: "f0ce84").cgColor]
            gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
            gradientLayer.frame = self.view.bounds
            pushView.clipsToBounds = true
            pushView.layer.cornerRadius = 8.0
            pushView.layer.addSublayer(gradientLayer)

            pushView.bringSubview(toFront: pushImage)
            pushView.bringSubview(toFront: pushLABEL)
            pushView.bringSubview(toFront: pushDescription)
        }
    }
    
    func createStoargeGradientLayer() {
        
        self.storageView.layer.cornerRadius = 8.0
        self.storageView.layer.masksToBounds = true
        
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor_HexValue.init(hex: "2280ff").cgColor, UIColor_HexValue.init(hex: "1064ee").cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        self.storageView.layer.addSublayer(gradientLayer)
        
        self.storageView.bringSubview(toFront: storageImage)
        self.storageView.bringSubview(toFront: storageLabel)
        self.storageView.bringSubview(toFront: storageDescription)
        
    }
    
    func createUserGradientLayer() {
        
        self.usersView.layer.cornerRadius = 8.0
        self.usersView.layer.masksToBounds = true
        
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor_HexValue.init(hex: "00a5be").cgColor, UIColor_HexValue.init(hex: "00e375").cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        self.usersView.layer.addSublayer(gradientLayer)
        self.usersView.layer.cornerRadius = 8.0
        
        self.usersView.bringSubview(toFront: usersImage)
        self.usersView.bringSubview(toFront: userLabel)
        self.usersView.bringSubview(toFront: userDescription)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "push" {
            let destiVC = segue.destination as? SHPushViewController
            destiVC?.isFromMenu = false
        }
        else if segue.identifier == "storage" {
            let destiVC = segue.destination as? SHStorageViewController
            destiVC?.isFromMenu = false
        }
        else if segue.identifier == "users" {
            let destiVC = segue.destination as? SHUsersViewController
            destiVC?.isFromMenu = false
        }
    }
    
    
    @objc func pushViewTap() {
        self.performSegue(withIdentifier: "push", sender: self)
    }

    @objc func storageViewTap() {
        self.performSegue(withIdentifier: "storage", sender: self)
    }
    
    @objc func usersViewTap() {
        self.performSegue(withIdentifier: "users", sender: self)
    }
}


extension SHHomeViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
