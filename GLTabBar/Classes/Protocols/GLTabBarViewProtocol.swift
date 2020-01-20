//
//  GLTabBarViewProtocol.swift
//
//  Created by Alexey Gross on 06/09/2019.
//

import UIKit

/// Protocol that describes the way how to interact with tab bar view
public protocol GLTabBarViewProtocol {
    
    /// Reloads tab bar from scratch
    /// Call this method to clear a surface of tab bar view to fully redraw it's content
    func reloadData()
    
    /// Drop all tab items selections to defaults
    /// Shows a content view related to default selection of tab bar item
    func deselectTabs()
    
    /// Select a specific tab bar item
    /// It makes visible a content view related to this tab bar item
    func select(tabBarItem: GLTabBarIndex, isAnimated: Bool)
    
    /// Retuns a tab bar view
    /// Recomend to use this protocol instead of direct usage of GLTabBarView class
    /// to make the view as much passive as possible
    func view() -> UIView
}
