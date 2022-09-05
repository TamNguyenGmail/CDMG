//
//  BaseTabBarController.swift
//  CDMG-Project
//
//  Created by Nguyen Minh Tam on 05/09/2022.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home
    case notification
    case news
    case ulities
    case blogs
    
    var rawValue: String {
        get {
            switch self {
            case .home:
                return "Home"
                
            case .notification:
                return "Notifications"
                
            case .news:
                return "News"
                
            case .ulities:
                return "Ulities"
                
            case .blogs:
                return "Blogs"
                
            }
        }
    }

    var viewController: UIViewController {
        switch self {
        case .home:
            let rootVC = HomeViewController()
            return UINavigationController(rootViewController: rootVC)

        case .notification:
            let rootVC = NotificationViewController()
            return UINavigationController(rootViewController: rootVC)
            
        case .news:
            let rootVC = NewsViewController()
            return UINavigationController(rootViewController: rootVC)
            
        case .ulities:
            let rootVC = UlityViewController()
            return UINavigationController(rootViewController: rootVC)
            
        case .blogs:
            let rootVC = BlogViewController()
            return UINavigationController(rootViewController: rootVC)
            
        }
        
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "ic_home")
            
        case .notification:
            return UIImage(named: "ic_notification")
            
        case .news:
            return UIImage(named: "ic_news")
            
        case .ulities:
            return UIImage(named: "ic-ulity")
            
        case .blogs:
            return UIImage(named: "ic_blog")
            
        }
    }
    
    var displayTitle: String {
        
        return self.rawValue.capitalized(with: nil)
        
    }
        
}

class BaseTabBarController: UITabBarController {
    //MARK: Properties
    var customTabBar: CustomTabView?
    var tabBarHeight: CGFloat = 82.0
    private var tabbarItems = [TabItem]()
    
    //MARK: View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadTabBar()
        
    }
    
    //MARK: Helpers
    func loadTabBar() {
                
        let tabbarItems: [TabItem] = [.home, .notification, .news, .ulities, .blogs]
        self.tabbarItems = tabbarItems
        
        setupCustomTabMenu(tabbarItems) { [weak self] viewControllers in
            guard let self = self else {return}
            
            self.viewControllers = viewControllers
            
        }
        
    }
    
    func setupCustomTabMenu(_ menuItems: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        
        tabBar.isHidden = true
        
        let customTabBar = CustomTabView(menuItems: menuItems, frame: frame)
        self.customTabBar = customTabBar
        
        customTabBar.clipsToBounds = true
        customTabBar.itemTapped = changeTab(tab:)
        
        view.backgroundColor = .clear
        view.addSubview(customTabBar)
        customTabBar.snp.makeConstraints{ make in
            
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(tabBarHeight)
            
        }
        
        menuItems.forEach{controllers.append($0.viewController)}
        
        view.layoutIfNeeded()
        completion(controllers)
        
    }

    func changeTab(tab: Int) {
        
        self.selectedIndex = tab
        
    }
 
}



