//
//  JobDetailsView.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit

class JobDetailsView: UIView {
    
    let titleLabel = JSLabel(font: .headline7)
    let companyLabel = JSLabel(font: .body2)
    
    let locationLabel = JSLabel(font: .caption)
    let industryLabel = JSLabel(font: .caption)
    let salaryLabel = JSLabel(font: .body2)
    
    let appliedImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "checkmark.circle")?.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = .systemGreen
        return imgView
    }()
    let appliedLabel: UILabel = {
        let label = JSLabel(font: .body2)
        label.text = "job_list_applied".localized()
        return label
    }()
    lazy var appliedStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            appliedImgView,
            appliedLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6
        return stackView
    }()
    let descriptionLabel: UILabel = {
        let label = JSLabel(font: .body2)
        label.numberOfLines = 3
        return label
    }()
    let applyButton: UIButton = {
        let button = JSPrimaryButton()
        button.setTitle("job_details_apply".localized(), for: .normal)
        return button
    }()
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            companyLabel,
            locationLabel,
            industryLabel,
            salaryLabel,
            appliedStackView,
            descriptionLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .backgroundSecondary
        
        addSubview(contentStackView)
        addSubview(applyButton)
        
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            applyButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            applyButton.topAnchor.constraint(greaterThanOrEqualTo: contentStackView.bottomAnchor, constant: 12),
            applyButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            applyButton.heightAnchor.constraint(equalToConstant: 48),
            applyButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
