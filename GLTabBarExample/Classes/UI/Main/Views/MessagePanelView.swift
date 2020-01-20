//
//  MessagePanelView.swift
//  GLTabBarExample
//
//  Created by Alexey Gross on 06/09/2019.
//

import UIKit

class MessagePanelView: UIView {
    
    var backView: UIView!
    var textViewBackgroundView: UIView!
    var textView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backView = UIView(frame: .zero)
        backView.backgroundColor = .lightGray
        backView.alpha = 0.5
        addSubview(backView)
        
        textViewBackgroundView = UIView(frame: .zero)
        textViewBackgroundView.backgroundColor = .white
        textViewBackgroundView.layer.cornerRadius = 20
        addSubview(textViewBackgroundView)
        
        textView = UITextView(frame: .zero)
        textView.backgroundColor = .clear
        textView.text = "Message text"
        textView.textColor = .lightGray
        textViewBackgroundView.addSubview(textView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        backView.frame = CGRect(x: 0,
                                y: 0,
                                width: self.frame.size.width,
                                height: self.frame.size.height)
                
        let textViewBackgroundViewHeight: CGFloat = 40.0
        let textViewBackgroundViewLeading: CGFloat = 16.0
        let textViewBackgroundViewTopOffset: CGFloat = 8.0
        textViewBackgroundView.frame = CGRect(x: textViewBackgroundViewLeading,
                                              y: textViewBackgroundViewTopOffset,
                                              width: self.frame.size.width - textViewBackgroundViewLeading * 2,
                                              height: textViewBackgroundViewHeight)
        
        let textViewLeading: CGFloat = 10
        let textViewTopOffset: CGFloat = 5
        textView.frame = CGRect(x: textViewLeading,
                                y: textViewTopOffset,
                                width: textViewBackgroundView.frame.size.width - textViewLeading * 2,
                                height: textViewBackgroundView.frame.size.height - textViewTopOffset * 2)
    }
}
