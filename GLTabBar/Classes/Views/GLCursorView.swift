//
//  GLCursorView.swift
//  GLTabBar
//
//  Created by Alexey Gross on 09/09/2019.
//

import UIKit

open class GLCursorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Public methods
    
    func update(with style: GLCursorStyle) {
        
        switch style {
        case .red:
            frame = CGRect(x: 0, y: 0, width: 30.0, height: 4.0)
            layer.cornerRadius = 2
            layer.backgroundColor = UIColor(red: 1.0, green: 76.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0).cgColor
        }
    }
}
