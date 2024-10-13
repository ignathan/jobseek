//
//  ProfileView.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

class ProfileView: UIView {
    
    let logoutButton: UIButton = {
        let button = JSPrimaryButton()
        button.setTitle("profile_logout".localized(), for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .backgroundSecondary
        
        addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            logoutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -6),
            logoutButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            logoutButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
