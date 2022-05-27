//
//  TabBar.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

let colorSet = UIColor(hex: 0x4885CC)

class Tabbar: UITabBarController {
    let feedView = ViewController()
    let logInView = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.tintColor = UIColor(ciColor: .init(color: colorSet))
        setupControllers()
    }
    
    private func setupControllers() {
        
        let feedNavigationController = UINavigationController(rootViewController: feedView)
        let LogInViewController = UINavigationController(rootViewController: logInView)
        
        feedView.tabBarItem.title = "Назад"
        feedView.tabBarItem.image = UIImage(systemName: "house.fill")
        feedView.navigationItem.title = "Назад"
        
        logInView.tabBarItem.title = "Профиль"
        logInView.tabBarItem.image = UIImage(systemName: "person.fill")
        logInView.navigationItem.title = "Профиль"
        viewControllers = [feedNavigationController, LogInViewController]
    }
    
}
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
