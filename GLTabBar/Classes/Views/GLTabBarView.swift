//
//  GLTabBarView.swift
//
//  Created by Alexey Gross on 03/09/2019.
//

import UIKit

/// Returns the tab view managed by the controller object
open class GLTabBarView: UIView {
    
    public weak var dataSource: GLTabBarDatasource? {
        willSet {
            dataSourceHas.numberOfTabs = newValue?.numberOfTabs() ?? 0
            dataSourceHas.tabBarLocation = newValue?.tabBarLocation() ?? .bottom
        }
    }
    
    public weak var delegate: GLTabBarDelegate? {
        willSet {
            let tabBarOffsetInfo = newValue?.tabBarOffset()
            delegateHas.tabBarOffsetLocation = tabBarOffsetInfo?.0 ?? .top
            delegateHas.tabBarOffset = tabBarOffsetInfo?.1 ?? 0.0
            delegateHas.tabBarHeight = newValue?.tabBarHeight() ?? 0.0
        }
    }
    
    public var selectedTabBarItem: GLTabBarIndex = GLTabBarIndex(position: 0)
    public var cursorView: GLCursorView!
    public var cursorAnimationDuration = 0.2
    
    private var cursorHolderView: UIView!
    private var cursorShouldAnimate = false
    
    private var tabBarItems: [GLTabBarItemView] = []
    private var contentViews: [UIView] = []
    
    fileprivate struct DataSourceHas {
        var numberOfTabs: Int = 0
        var tabBarLocation: GLTabBarLocation = .bottom
    }
    
    fileprivate struct DelegateHas {
        var tabBarHeight: CGFloat = 0
        var tabBarOffset: CGFloat = 0
        var tabBarOffsetLocation: GLTabBarLocation = .top
    }
    
    private var dataSourceHas: DataSourceHas = DataSourceHas()
    private var delegateHas: DelegateHas = DelegateHas()
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        cursorHolderView = UIView(frame: .zero)
        
        cursorView = GLCursorView(frame: .zero)
        cursorView.update(with: .red)
        cursorHolderView.addSubview(cursorView)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()

        let frames = calculateFrames()
        let tabBarRect = frames.tabBarItemRect
        let contentViewRect = frames.contentViewRect
        
        // Tab Bar Items
        for (index, tabBarItem) in tabBarItems.enumerated() {

            tabBarItem.frame = CGRect(x: CGFloat(index) * tabBarRect.width,
                                      y: tabBarRect.origin.y,
                                      width: tabBarRect.size.width,
                                      height: tabBarRect.size.height)
        }
        
        // Tab Bar Content Views
        for contentView in contentViews {
            
            contentView.frame = CGRect(x: contentViewRect.origin.x,
                                       y: contentViewRect.origin.y,
                                       width: contentViewRect.size.width,
                                       height: contentViewRect.size.height)
        }
        
        
        cursorHolderView.frame = CGRect(x: 0.0,
                                        y: tabBarRect.origin.y + tabBarRect.size.height - cursorView.frame.size.height,
                                        width: frame.size.width,
                                        height: cursorView.frame.size.height)
        
        
        let tabBarIndex = selectedTabBarItem.position
        if tabBarIndex < tabBarItems.count {

            let selectedTabBarItem = tabBarItems[tabBarIndex]
            if cursorShouldAnimate {

                UIView.animate(withDuration: cursorAnimationDuration, delay: 0, options: .curveEaseOut, animations: { [unowned self] in

                               self.cursorView.frame = CGRect(x: selectedTabBarItem.center.x - self.cursorView.frame.size.width / 2,
                                                              y: 0.0,
                                                              width: self.cursorView.frame.size.width,
                                                              height: self.cursorView.frame.size.height)
                }, completion: nil)
                
            } else {
                self.cursorView.frame = CGRect(x: selectedTabBarItem.center.x - self.cursorView.frame.size.width / 2,
                                               y: 0.0,
                                               width: self.cursorView.frame.size.width,
                                               height: self.cursorView.frame.size.height)
            }
            
        }
    }
    
    // MARK: - Private methods
    
    func calculateFrames() -> (tabBarItemRect: CGRect, contentViewRect: CGRect) {
        
        let tabBarItemWidth: CGFloat = frame.size.width / CGFloat(tabBarItems.count)
        var tabBarItemOriginY: CGFloat = 0.0
        var contentViewOriginY: CGFloat = 0.0
        var contentViewHeight: CGFloat = 0.0
        
        if delegateHas.tabBarOffsetLocation == .top {
            
            switch dataSourceHas.tabBarLocation {
            case .top:
                tabBarItemOriginY = delegateHas.tabBarOffset;
                contentViewOriginY = tabBarItemOriginY + delegateHas.tabBarHeight
                contentViewHeight = frame.size.height - contentViewOriginY
            case .bottom:
                tabBarItemOriginY = frame.size.height - delegateHas.tabBarHeight
                contentViewOriginY = delegateHas.tabBarOffset
                contentViewHeight = frame.size.height - contentViewOriginY - delegateHas.tabBarHeight
            }
            
        } else if delegateHas.tabBarOffsetLocation == .bottom {
            
            switch dataSourceHas.tabBarLocation {
            case .top:
                tabBarItemOriginY = 0;
                contentViewOriginY = tabBarItemOriginY + delegateHas.tabBarHeight
                contentViewHeight = frame.size.height - contentViewOriginY - delegateHas.tabBarOffset
            case .bottom:
                tabBarItemOriginY = frame.size.height - delegateHas.tabBarHeight - delegateHas.tabBarOffset
                contentViewOriginY = 0
                contentViewHeight = frame.size.height - delegateHas.tabBarHeight - delegateHas.tabBarOffset
            }
        }
        
        let tabBarItemRect = CGRect(x: 0, y: tabBarItemOriginY, width: tabBarItemWidth, height: delegateHas.tabBarHeight)
        let contentViewRect = CGRect(x: 0, y: contentViewOriginY, width: frame.size.width, height: contentViewHeight)
        
        return (tabBarItemRect, contentViewRect)
    }
    
    private func eraseInterfaceComponents() {
        
        for tabBarItem in tabBarItems {
            tabBarItem.removeFromSuperview()
        }
        
        for contentView in contentViews {
            contentView.removeFromSuperview()
        }
        
        tabBarItems = []
        contentViews = []
    }
}

// MARK: - TabBarViewProtocol
extension GLTabBarView: GLTabBarViewProtocol {
    
    public func reloadData() {
        
        // Clear old views
        eraseInterfaceComponents()

        // Add new views
        if let dataSource = dataSource {
            
            for index in 0..<dataSourceHas.numberOfTabs {
                
                let tabBar = GLTabBarIndex(position: index)

                // Tab Bar Items
                let tabBarItem = dataSource.tab(for: tabBar)
                tabBarItem.button.tag = index
                tabBarItem.button.addTarget(self, action: #selector(tabBarItemDidTap(sender:)), for: .touchUpInside)
                tabBarItems.append(tabBarItem)
                addSubview(tabBarItem)
                print("\((#file as NSString).lastPathComponent): Added tab bar item #\(index + 1)")

                /// Tab Bar Content Views
                let contentView = dataSource.contentView(for: tabBar)
                contentView.isHidden = true
                contentViews.append(contentView)
                addSubview(contentView)
                print("\((#file as NSString).lastPathComponent): Added tab bar content view #\(index + 1)")
            }
        }
        
        if !tabBarItems.isEmpty {
            cursorHolderView.removeFromSuperview()
            addSubview(cursorHolderView)
        }
        
        // Select first tab
        deselectTabs()
    }
    
    public func deselectTabs() {
        select(tabBarItem: GLTabBarIndex(position: 0), isAnimated: false)
    }
        
    public func select(tabBarItem: GLTabBarIndex, isAnimated: Bool) {
        
        selectedTabBarItem = tabBarItem
        cursorShouldAnimate = isAnimated
        
        for contentView in contentViews {
            contentView.isHidden = true
        }
        
        let index = tabBarItem.position
        if index < contentViews.count {
            let contentView = contentViews[index]
            contentView.isHidden = false
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    public func view() -> UIView {
        return self
    }
    
    // MARK: - Button actions
    @objc func tabBarItemDidTap(sender: GLTabBarItemView) {
        
        if let delegate = delegate {
            let tabBarItemIndex = GLTabBarIndex(position: sender.tag)
            select(tabBarItem: tabBarItemIndex, isAnimated: true)
            delegate.didTap(at: tabBarItemIndex)
        }
    }
}
