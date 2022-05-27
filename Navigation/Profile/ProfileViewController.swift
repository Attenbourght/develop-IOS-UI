//
//  ProfileViewController.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 27.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileHeader)
        profileHeader.backgroundColor = .lightGray
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        profileHeader.frame = CGRect(x: 0,
                                     y: view.safeAreaInsets.top,
                                     width: view.frame.width,
                                     height: view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
