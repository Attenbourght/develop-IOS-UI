//
//  TabBar.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

let colorSet = UIColor(hex: 0x4885CC)

class TabBar: UITabBarController {
    let feedView = FeedViewController()
    let logInView = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.view.tintColor = UIColor(ciColor: .init(color: colorSet))
        setupControllers()
    }
    
    private func setupControllers() {
        
        let feedNavigationController = UINavigationController(rootViewController: feedView)
        let logInViewController = UINavigationController(rootViewController: logInView)
        
        feedView.tabBarItem.title = "Feed"
        feedView.tabBarItem.image = UIImage(systemName: "house.fill")
        feedView.navigationItem.title = "Feed"
        
        logInView.tabBarItem.title = "Profile"
        logInView.tabBarItem.image = UIImage(systemName: "person.fill")
        logInView.navigationItem.title = "Profile"
        
        viewControllers = [feedNavigationController, logInViewController]
    }
}

// MARK: - перевод цвета из HEX в RGB для UIColor
extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
