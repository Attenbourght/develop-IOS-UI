//
//  ViewController.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

struct Post {
    var title : String
}


class ViewController: UIViewController {

    var post = Post(title: "Пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        makeButton()
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Пост", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func buttonAction() {
        let postView = NewViewController()
        postView.postTitle = post.title
        navigationController?.pushViewController(postView, animated: true)
    }
}


