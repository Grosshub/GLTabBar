//
//  GLTabBarItemView.swift
//
//  Created by Alexey Gross on 04/09/2019.
//

import UIKit

/// The visual representation of a single tab bar item in a tab bar view
open class GLTabBarItemView: UIView {
    
    public var titleLabel: UILabel!
    public var iconView: UIImageView!
    public var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel(frame: .zero)
        self.addSubview(titleLabel)
        
        iconView = UIImageView(frame: .zero)
        self.addSubview(iconView)
        
        button = UIButton(frame: .zero)
        self.addSubview(button)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.sizeToFit()
        let titleLabelTopOffset: CGFloat = 10.0
        titleLabel.frame = CGRect(x: (self.frame.size.width - titleLabel.frame.size.width) / 2,
                                  y: titleLabelTopOffset,
                                  width: titleLabel.frame.size.width,
                                  height: titleLabel.frame.size.height)
        
        
        var iconSize = CGSize(width: 0, height: 0)
        if let icon = iconView.image {
            let iconSizeMax = CGSize(width: self.frame.size.width, height: self.frame.size.height)
            iconSize = CGSize(width: icon.size.width > iconSizeMax.width ? iconSizeMax.width : icon.size.width,
                              height: icon.size.height > iconSizeMax.height ? iconSizeMax.height : icon.size.height)
        }
        iconView.frame = CGRect(x: (self.frame.size.width - iconSize.width) / 2,
                                y: (self.frame.size.height - iconSize.height) / 2,
                                width: iconSize.width,
                                height: iconSize.height)
        
        
        button.frame = CGRect(x: 0,
                              y: 0,
                              width: self.frame.size.width,
                              height: self.frame.size.height)
    }
}
