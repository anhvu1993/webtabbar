//
//  showWebViewController.swift
//  Demotabbar
//
//  Created by Bui Van Tuan on 7/11/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit
public var WEB_VIEW = "web"
extension Notification.Name {
    static let showColor = Notification.Name("showColor")
}

class CustomTabViewController: UITabBarController, UITabBarControllerDelegate {
    var indexSelected = 0
    @IBOutlet weak var tabarVc: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedIndex = self.indexSelected
        tabBar.tintColor = #colorLiteral(red: 0.937254902, green: 0.2078431373, blue: 0.168627451, alpha: 1)
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        indexSelected = self.selectedIndex
        if item.title == WEB_VIEW {
            tabBar.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            let alertController = UIAlertController(title: "Messenger", message: "Bạn muốn truy cập vào web ", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Safari", style: .default, handler: {(action: UIAlertAction) in
                guard let url = URL(string: "https://developer.apple.com/") else { return }
                UIApplication.shared.open(url)
               self.selectedIndex = self.indexSelected
                tabBar.tintColor = #colorLiteral(red: 0.937254902, green: 0.2078431373, blue: 0.168627451, alpha: 1)
                print("Selected item", item.title! )
            }))
            alertController.addAction(UIAlertAction(title: "WebView", style: .default, handler: { (action: UIAlertAction) in
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewViewController") as? UINavigationController else {return}
                self.present(vc, animated: true, completion: nil)
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction) in
               self.selectedIndex = self.indexSelected
//                self.selectedIndex = 0
                tabBar.tintColor = #colorLiteral(red: 0.937254902, green: 0.2078431373, blue: 0.168627451, alpha: 1)
            }))
            alertController.view.tintColor = UIColor.red
            self.present(alertController, animated: true, completion: nil)
            
        }else {
            
            tabBar.tintColor = #colorLiteral(red: 0.937254902, green: 0.2078431373, blue: 0.168627451, alpha: 1)
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller", viewController)
        print("index", tabBarController.selectedIndex )
        
    }
}


