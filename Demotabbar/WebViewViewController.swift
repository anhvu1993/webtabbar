//
//  ViewController.swift
//  Demotabbar
//
//  Created by Bui Van Tuan on 7/11/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController, UIWebViewDelegate {
     @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var showBack: UIButton!
    @IBOutlet weak var showNext: UIButton!
    
    var urlString = "https://www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNext.isHidden = true
        showBack.isHidden = true
        setupWebView(url: urlString)
    }
    
    func setupWebView(url: String) {
        self.myWebView.delegate = self
        guard let url = URL(string: url) else {return}
        let request = URLRequest(url: url)
        self.myWebView.loadRequest(request)
    }
    
    @IBAction func backHome(_ sender: Any) {
        NotificationCenter.default.post(name: .showColor, object: textInput.text , userInfo: nil)
       dismiss(animated: true, completion: nil)
       
    }
   
    @IBAction func backWithWebView(_ sender: Any) {
        if myWebView.canGoBack {
            myWebView.goBack()
        }
    }
    @IBAction func nextWithWebView(_ sender: Any) {
        if myWebView.canGoForward{
            myWebView.goForward()
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if myWebView.canGoForward{
            showNext.isHidden  = false
        }else if myWebView.canGoBack{
            showBack.isHidden  = false
            showNext.isHidden  = true
        }else {
            print("error")
        }
        
        switch myWebView.canGoBack {
        case false:
            showBack.isHidden  = true
        default:
            showBack.isHidden  = false
        }
    }
    
}

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(vc, animated: animated)
        }
    }
}

extension UIViewController {
    
    func pop(numberOfTimes: Int) {
        guard let navigationController = navigationController else {
            return
        }
        let viewControllers = navigationController.viewControllers
        let index = numberOfTimes + 1
        if viewControllers.count >= index {
            navigationController.popToViewController(viewControllers[viewControllers.count - index], animated: true)
        }
    }
}
