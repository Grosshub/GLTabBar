//
//  GLTabBarIndex.swift
//
//  Created by Alexey Gross on 06/09/2019.
//

import Foundation

/// Represents a specific tab bar item position inside a tab bar view
public struct GLTabBarIndex {
    
    public var name: String
    public var position: Int
    
    init(name: String? = nil, position: Int? = nil) {
        self.name = name ?? ""
        self.position = position ?? 0
    }
    
    init(name: String? = nil, position: Int) {
        self.name = name ?? ""
        self.position = position
    }
    
    mutating func set(name: String) {
        self.name = name
    }
}
