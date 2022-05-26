//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Никита Спевак on 24.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screnWidth = UIScreen.main.bounds.width
        if let myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first
            as? ProfileView {
            myView.frame = CGRect(x: 16, y: 44, width: screnWidth - 16, height: 1250)
            view.addSubview(myView)
        }
    }
}
