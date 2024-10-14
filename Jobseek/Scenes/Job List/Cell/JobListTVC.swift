//
//  JobListTVC.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit

class JobListTVC: UITableViewCell {
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cardBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    let titleLabel = JSLabel(font: .headline7)
    
    let companyLabel = JSLabel(font: .caption)
    
    let locationLabel = JSLabel(font: .caption)
    
    let descriptionLabel: UILabel = {
        let label = JSLabel(font: .body2)
        label.numberOfLines = 3
        return label
    }()
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
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            companyLabel,
            locationLabel,
            descriptionLabel,
            appliedStackView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        selectionStyle = .none
        
        contentView.addSubview(cardView)
        
        cardView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            contentStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            contentStackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18),
            contentStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
            contentStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -18),
            
            appliedImgView.widthAnchor.constraint(equalToConstant: 18),
            appliedImgView.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(model: JobListTVCModel) {
        
        titleLabel.text = model.positionTitle
        
        companyLabel.text = model.companyName
        
        locationLabel.text = model.location
        
        descriptionLabel.text = model.description
        
        appliedImgView.isHidden = !model.applied
    }
}
