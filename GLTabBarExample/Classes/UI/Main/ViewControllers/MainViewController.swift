//
//  MainViewController.swift
//  GLTabBarExample
//
//  Created by Alexey Gross on 06/09/2019.
//

import UIKit
import GLTabBar

class MainViewController: UIViewController {
    
    var mainView: MainView!
    var tabBarViewController: TabBarController
    
    init(tabBarViewController: TabBarController) {
        self.tabBarViewController = tabBarViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        mainView = MainView(frame: UIScreen.main.bounds)
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tabBarView.delegate = tabBarViewController
        mainView.tabBarView.dataSource = tabBarViewController
        tabBarViewController.set(tabBarView: mainView.tabBarView)
        mainView.tabBarView.reloadData()
    }
}
