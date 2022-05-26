//
//  TabBar.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

class Tabbar: UITabBarController {
    
    let UINCOne = ViewController()
    let UINCTwo = NewViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        UINCOne.tabBarItem.title = "Первый"
        let nControllerOne = UINavigationController(rootViewController: UINCOne)
        UINCOne.navigationItem.title = "Light Gray"
        UINCOne.tabBarItem.image = UIImage(systemName: "arrow.left.to.line")
        UINCTwo.tabBarItem.title = "Второй"
        let nControllerTwo = UINavigationController(rootViewController: UINCTwo)
        UINCTwo.tabBarItem.image = UIImage(systemName: "arrow.right.to.line")
        UINCTwo.navigationItem.title = "Space Gray"
        viewControllers = [nControllerOne, nControllerTwo]
    }
    
}
