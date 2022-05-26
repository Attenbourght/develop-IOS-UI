//
//  TwoViewController.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 25.05.2022.
//

import UIKit

class TwoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        niceButton()
        
    }
    private func niceButton() {
        let oneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 400, height: 80))
        oneButton.center = view.center
        oneButton.setTitle("Что-то пошло не так. Нажми еще раз .-. ", for: .normal)
        oneButton.backgroundColor = .black
        oneButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside )
        view.addSubview(oneButton)
    }
    @objc private func tapAction() {
        let alert = UIAlertController(title: "Time to choose!", message: "" , preferredStyle: .alert)
       let okAction = UIAlertAction(title: "Вернуться назад?", style: .default) { _ in
           self.dismiss(animated: true)
           //self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Остаемся?", style:.default)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
