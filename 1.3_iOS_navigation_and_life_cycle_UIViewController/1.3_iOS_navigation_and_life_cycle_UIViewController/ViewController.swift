//
//  ViewController.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        firstButton()
    }
    private func firstButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 400, height: 40))
        button.center = view.center
        button.setTitle("Тут могла быть ваша реклама", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapAction() {
        let InfoViewController = TwoViewController()
        present( InfoViewController , animated: true)
    }

}

