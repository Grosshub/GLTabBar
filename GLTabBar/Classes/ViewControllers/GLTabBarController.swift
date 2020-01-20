//
//  GLTabBarController.swift
//
//  Created by Alexey Gross on 03/09/2019.
//

import UIKit

/// A view controller that specializes in managing a tab bar view
open class GLTabBarController: UIViewController {
    
    var tabBarView: GLTabBarViewProtocol
    var clearsSelectionOnViewWillAppear: Bool = false
    
    private var tabLocation: GLTabBarLocation = .top
    
    public init() {
        tabBarView = GLTabBarView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func loadView() {
        self.view = tabBarView.view()
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if clearsSelectionOnViewWillAppear {
            tabBarView.deselectTabs()
        }
    }
    
    // MARK: - Public methods
    
    public func set(tabBarView: GLTabBarView) {
        self.view = tabBarView
    }
}
