//
//  ChatViewController.swift
//  GLTabBarExample
//
//  Created by Alexey Gross on 06/09/2019.
//

import UIKit

class ChatViewController: UIViewController {
    
    override func loadView() {
        let simpleView = UIView()
        simpleView.backgroundColor = .purple
        simpleView.alpha = 0.3
        self.view = simpleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
