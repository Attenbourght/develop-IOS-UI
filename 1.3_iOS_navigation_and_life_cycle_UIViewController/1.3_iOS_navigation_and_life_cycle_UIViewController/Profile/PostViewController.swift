//
//  PostViewController.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 27.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var postTitle: String = "Post" // Title по умолчанию
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = postTitle
        view.backgroundColor = .white
        makeBarItem()
        
    }
    private func makeBarItem() {
        let rightBarItem = UIBarButtonItem(title: "Information", style: .plain, target: self, action: #selector(buttonAction))
        self.navigationItem.title = postTitle
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc private func buttonAction() {
        let infoView = TwoViewController()
        navigationController?.pushViewController(infoView, animated: true)
    }
    
    
}
