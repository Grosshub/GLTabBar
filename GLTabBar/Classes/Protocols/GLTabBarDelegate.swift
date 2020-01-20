//
//  GLTabBarDelegate.swift
//
//  Created by Alexey Gross on 04/09/2019.
//

import UIKit

/// Methods for managing and configuring tab bar items in Tab Bar View
public protocol GLTabBarDelegate: class {
    
    /// Returns a height of a tab bar item
    func tabBarHeight() -> CGFloat
    
    /// Set an offset to a tab bar view with a specific location
    /// For example when .top is selected with 10.0 points
    /// it will add an offset on the top of tab bar view
    func tabBarOffset() -> (GLTabBarLocation, CGFloat)
    
    /// Called when tab bar item selected
    /// - Parameter tabBar: Position of a selected tab
    func didTap(at tabBar: GLTabBarIndex)
}
