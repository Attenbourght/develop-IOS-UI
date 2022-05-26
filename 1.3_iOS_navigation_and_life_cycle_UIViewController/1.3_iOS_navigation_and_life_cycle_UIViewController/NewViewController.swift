//
//  NewViewController.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

class NewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        twoButton()
    }
    private func twoButton() {
        let twoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 400, height: 80))
        twoButton.center = view.center
        twoButton.setTitle("Hello World!", for: .normal)
        twoButton.backgroundColor = .black
        twoButton.addTarget(self, action: #selector(tapActionTwo), for: .touchUpInside )
        view.addSubview(twoButton)
    }
    
    private func maketBarItem() {
        let barItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(tapActionTwo))
        navigationItem.leftBarButtonItem = barItem
    }
    @objc private func tapActionTwo() {
        let vc = ViewController()
        vc.title = "Назад"
        navigationController?.pushViewController(vc, animated: true)
    }
}
