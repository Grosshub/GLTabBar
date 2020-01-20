//
//  MainView.swift
//  GLTabBarExample
//
//  Created by Alexey Gross on 06/09/2019.
//

import UIKit
import GLTabBar

class MainView: UIView {
    
    var backgroundView: UIImageView!
    var tabBarView: GLTabBarView!
    var messagePanelView: MessagePanelView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView = UIImageView(frame: .zero)
        backgroundView.image = UIImage(named: "background")
        addSubview(backgroundView)
        
        tabBarView = GLTabBarView(frame: .zero)
        addSubview(tabBarView)
        
        messagePanelView = MessagePanelView(frame: .zero)
        addSubview(messagePanelView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = CGRect(x: 0,
                                      y: 0,
                                      width: self.frame.size.width,
                                      height: self.frame.size.height)
        
        
        tabBarView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: self.frame.size.width,
                                  height: self.frame.size.height)
        
        
        let messagePanelHeight: CGFloat = 64.0
        messagePanelView.frame = CGRect(x: 0.0,
                                        y: self.frame.size.height - messagePanelHeight,
                                        width: self.frame.size.width,
                                        height: messagePanelHeight)
    }
}
