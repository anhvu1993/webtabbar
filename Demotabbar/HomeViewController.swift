//
//  HomeViewController.swift
//  Demotabbar
//
//  Created by Bui Van Tuan on 7/11/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var textInput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
    }
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(actionColor), name: .showColor, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(true)
    }
    @objc func actionColor(data: Notification) {
        self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        textInput.text = "hello"
    }
}
