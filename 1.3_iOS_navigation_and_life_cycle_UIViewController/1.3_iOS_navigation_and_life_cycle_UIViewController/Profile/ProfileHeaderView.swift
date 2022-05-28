//
//  ProfileHeaderView.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 27.05.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupGestures()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var statusText = String()
    private lazy var avatarImagePosition = avatarImageView.layer.position
    private lazy var avatarImageBounds = avatarImageView.layer.bounds
    
    private lazy var avatarView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.isUserInteractionEnabled = false
        $0.alpha = 0.0
        return $0
    }(UIView())
    
    private lazy var closeAvatarImageButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "multiply.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(colorSet, renderingMode: .alwaysOriginal), for: .normal)
        $0.alpha = 0.0
        $0.clipsToBounds = false
        $0.addTarget(self, action: #selector(closeAvatarAction), for: .touchUpInside)
        $0.isUserInteractionEnabled = false
        return $0
    }(UIButton())
    


    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "Zealot")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.backgroundColor = .systemBackground
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "Zealot"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return fullNameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Ожидание..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.isUserInteractionEnabled = false
        return statusLabel
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = colorSet
        setStatusButton.setTitle("Статус", for: .normal)
        setStatusButton.setTitleColor(UIColor.white, for: .normal)
        setStatusButton.layer.cornerRadius = 10
        //        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        //        setStatusButton.layer.shadowRadius = 4
        //        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        //        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return setStatusButton
    }()
    
    @objc private func buttonAction() {
        statusLabel.text = statusText
        statusTextField.text = ""
        self.endEditing(true)
        print(statusText)
    }
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.indent(size: 10)
        statusTextField.placeholder = "Введите новый статус..."
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 10
        statusTextField.addTarget(self, action: #selector(statusTextChanges), for: .editingChanged)
        return statusTextField
    }()
    
    @objc private func statusTextChanges() {
        statusText = statusTextField.text!
        print("Статус изменен")
    }
    
    private func setupGestures() {
        let tapAvatarGesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatarAction))
        avatarImageView.addGestureRecognizer(tapAvatarGesture)
    }
    
    @objc func tapAvatarAction() {
        
        self.avatarImagePosition = self.avatarImageView.layer.position
        self.avatarImageBounds = self.avatarImageView.layer.bounds
        
        UIImageView.animate(withDuration: 0.5,
                            animations: {
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: (UIScreen.main.bounds.midY - ProfileViewController.tableView.contentOffset.y))
            self.avatarView.alpha = 0.8
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.borderWidth = 0
            self.avatarImageView.isUserInteractionEnabled = false
            self.setStatusButton.isUserInteractionEnabled = false
            self.statusTextField.isUserInteractionEnabled = false
            ProfileViewController.tableView.isScrollEnabled = false
            ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = false
            ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 1))?.isUserInteractionEnabled = false
        },
                            completion: { _ in
            UIImageView.animate(withDuration: 0.3) {
                self.closeAvatarImageButton.alpha = 1
                self.closeAvatarImageButton.isUserInteractionEnabled = true
                self.layoutIfNeeded()
            }
        })
    }
    
    @objc private func closeAvatarAction() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.closeAvatarImageButton.alpha = 0
            self.closeAvatarImageButton.isUserInteractionEnabled = false
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.avatarView.alpha = 0.0
                self.avatarImageView.layer.position = self.avatarImagePosition
                self.avatarImageView.layer.bounds = self.avatarImageBounds
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
                self.avatarImageView.layer.borderWidth = 3
                self.avatarImageView.isUserInteractionEnabled = true
                self.setStatusButton.isUserInteractionEnabled = true
                self.statusTextField.isUserInteractionEnabled = true
                ProfileViewController.tableView.isScrollEnabled = true
                ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = true
                ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 1))?.isUserInteractionEnabled = true
                self.layoutIfNeeded()
            }
        }
    }
    
    private func setupLayout(){
        [fullNameLabel, statusLabel, setStatusButton, statusTextField, avatarView, avatarImageView, closeAvatarImageButton].forEach { addSubview($0) }

        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            avatarView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            closeAvatarImageButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
            closeAvatarImageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -64),            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 28),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}



extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
