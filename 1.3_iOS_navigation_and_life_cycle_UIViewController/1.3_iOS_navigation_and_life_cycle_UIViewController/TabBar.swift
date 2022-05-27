//
//  TabBar.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

class Tabbar: UITabBarController {
    
    let UINCOne = ViewController()
    let UINCTwo = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        
        let nControllerOne = UINavigationController(rootViewController: UINCOne)
        let nControllerTwo = UINavigationController(rootViewController: UINCTwo)
        
        
        UINCOne.tabBarItem.title = "Назад"
        UINCOne.tabBarItem.image = UIImage(systemName: "house.fill")
        UINCOne.navigationItem.title = "Назад"
        
        UINCTwo.tabBarItem.title = "Профиль"
        UINCTwo.tabBarItem.image = UIImage(systemName: "person.fill")
        UINCTwo.navigationItem.title = "Профиль"
        viewControllers = [nControllerOne, nControllerTwo]
    }
    
}
