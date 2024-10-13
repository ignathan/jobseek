//
//  LoginView.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

class LoginView: UIView {
    
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .button
        label.textColor = .textPrimary
        label.text = "login_username".localized()
        return label
    }()
    let usernameField = JSTextField()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .button
        label.textColor = .textPrimary
        label.text = "login_password".localized()
        return label
    }()
    let passwordField: UITextField = {
        let textField = JSTextField()
        textField.isSecureTextEntry = true
        return textField
    }()
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            usernameLabel,
            usernameField,
            passwordLabel,
            passwordField
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    let loginButton: UIButton = {
        let button = JSPrimaryButton()
        button.setTitle("login_continue".localized(), for: .normal)
        button.isEnabled = false
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .backgroundSecondary
        
        addSubview(contentScrollView)
        addSubview(loginButton)
        
        contentScrollView.addSubview(containerView)
        
        containerView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            contentScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            loginButton.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 6),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -6),
            
            containerView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor),
            
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
