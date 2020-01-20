//
//  GLTabBarDatasource.swift
//
//  Created by Alexey Gross on 04/09/2019.
//

import UIKit

/// The methods adopted by the object you use to manage data and configure UI components for a tab bar view
public protocol GLTabBarDatasource: class {
    
    /// Tells the data source to return the number of tabs in Tab Bar View
    func numberOfTabs() -> Int
    
    /// Returns a location of tab bar item views on the tab bar view
    func tabBarLocation() -> GLTabBarLocation
    
    /// Asks the data source for a tab bar item to insert in a particular location of the tab bar view
    /// - Parameter index: Position for a certain tab
    func tab(for index: GLTabBarIndex) -> GLTabBarItemView
    
    /// Returns a content view for a specific tab position
    /// - Parameter index: Position for a certain tab
    func contentView(for index: GLTabBarIndex) -> UIView
}
