//
//  SHMenuViewController.swift
//  App42Services
//
//  Created by Purnima Singh on 07/02/18.
//  Copyright © 2018 Shephertz Technologies. All rights reserved.
//

import UIKit

enum MenuItem: Int {
    case home = 0
    case push
    case stoarge
    case users
}

protocol MenuItemProtocol : class {
    func changeViewController(_ menu: MenuItem)
}

class SHMenuViewController: UIViewController, MenuItemProtocol {

    @IBOutlet weak var menuTableView: UITableView!

    var menus = ["Home", "Push", "Storage", "Users"]
    var menusImages = ["Home_Menu", "Push_Menu", "Storage_menu", "Users_Menu"]
    
    var homeViewController : UIViewController!
    var pushViewController: UIViewController!
    var storageViewController: UIViewController!
    var usersViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuTableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        self.view.backgroundColor = UIColor_HexValue.init(hex: "f5f5f5")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pushViewController = storyboard.instantiateViewController(withIdentifier: "SHPushViewController") as! SHPushViewController
        pushViewController.isFromMenu = true
        self.pushViewController = UINavigationController(rootViewController: pushViewController)
        
        let storageViewController = storyboard.instantiateViewController(withIdentifier: "SHStorageViewController") as! SHStorageViewController
        storageViewController.isFromMenu = true
        self.storageViewController = UINavigationController(rootViewController: storageViewController)
        
        let usersViewController = storyboard.instantiateViewController(withIdentifier: "SHUsersViewController") as! SHUsersViewController
        usersViewController.isFromMenu = true
        self.usersViewController = UINavigationController(rootViewController: usersViewController)
        
        self.menuTableView.registerCellClass(MenuTableViewCell.self)
        self.menuTableView.tableFooterView = UIView.init()
        self.menuTableView.separatorStyle = .none
    }
    
    func changeViewController(_ menu: MenuItem) {
        switch menu {
        case .home:
            self.slideMenuController()?.changeMainViewController(self.homeViewController, close: true)
        case .push:
            self.slideMenuController()?.changeMainViewController(self.pushViewController, close: true)
        case .stoarge:
            self.slideMenuController()?.changeMainViewController(self.storageViewController, close: true)
        case .users:
            self.slideMenuController()?.changeMainViewController(self.usersViewController, close: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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


extension SHMenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let menu = MenuItem(rawValue: indexPath.row) {
            switch menu {
            case .home, .push, .stoarge, .users:
                return MenuTableViewCell.height()
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = MenuItem(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if self.menuTableView = scrollView {
//            
//        }
//    }
}

extension SHMenuViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let menu = MenuItem(rawValue: indexPath.row) {
            switch menu {
            case .home, .push, .stoarge, .users:
                let cell = MenuTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: MenuTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                cell.setImageData(menusImages[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}



