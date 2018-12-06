//
//  ResultCollectionViewCell.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    private let descriptionLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        descriptionLabel.font = .boldSystemFont(ofSize: 17)
        contentView.addSubview(descriptionLabel)
        activateDescriptionLabelConstraints(view: descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(description: String) {
        descriptionLabel.text = description
    }
}

private typealias PrivateResultCollectionViewCell = ResultCollectionViewCell
private extension PrivateResultCollectionViewCell {
    func activateDescriptionLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
}
