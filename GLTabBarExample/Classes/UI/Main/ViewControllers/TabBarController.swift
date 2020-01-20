//
//  TabBarController.swift
//  GLTabBarExample
//
//  Created by Alexey Gross on 06/09/2019.
//

import UIKit
import GLTabBar

class TabBarController: GLTabBarController {
    
    fileprivate var chatViewController = ChatViewController()
    fileprivate var profileViewController = ProfileViewController()
}

extension TabBarController : GLTabBarDatasource {
    
    func numberOfTabs() -> Int { return TabBarIndex.allCases.count }
    
    func tabBarLocation() -> GLTabBarLocation { return .top }
    
    func contentView(for index: GLTabBarIndex) -> UIView {
        
        guard let tabBarIndex = TabBarIndex(rawValue: index.position) else {
            return UIView()
        }
        
        switch tabBarIndex {
        case .chat:
            return chatViewController.view
        case .profile:
            return profileViewController.view
        }
    }
    
    func tab(for index: GLTabBarIndex) -> GLTabBarItemView {
        
        let tabBarItem = GLTabBarItemView()
        
        guard let tabBarIndex = TabBarIndex(rawValue: index.position) else {
            return tabBarItem
        }
        
        switch tabBarIndex {
        case .chat:
            tabBarItem.iconView.image = UIImage(named: "chat")
            tabBarItem.backgroundColor = .purple
            
        case .profile:
            tabBarItem.iconView.image = UIImage(named: "profile")
            tabBarItem.backgroundColor = .yellow
        }
        
        return tabBarItem
    }
}

extension GLTabBarController : GLTabBarDelegate {
    
    public func tabBarOffset() -> (GLTabBarLocation, CGFloat) { return (.top, 80.0) }
    
    public func didTap(at tabBar: GLTabBarIndex) {
        print("\((#file as NSString).lastPathComponent): did tap at Tab Bar Item \(tabBar)")
    }
    
    public func tabBarHeight() -> CGFloat { return 80.0 }
}
