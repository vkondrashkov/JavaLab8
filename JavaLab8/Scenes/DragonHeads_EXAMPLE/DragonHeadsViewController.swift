//
//  DragonHeadsViewController.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol DragonHeadsView: class {
    func display(result: String)
}

class DragonHeadsViewController: UIViewController, DragonHeadsView {
    private var dragonHeadsView = UIView()
    private var containerView = UIView()
    private var ageLabel = UILabel()
    var ageField = UITextField()
    private var resultLabel = UILabel()
    private var submitButton = UIButton()
    private var anotherButton = UIButton()
    
    var presenter: DragonHeadsPresenter!

    override func loadView() {
        dragonHeadsView = UIView(frame: CGRect.zero)
        dragonHeadsView.backgroundColor = .white
        
        containerView = UIView(frame: CGRect.zero)
        
        ageLabel.text = "Dragon's age:"
        ageLabel.font = .boldSystemFont(ofSize: 17)
        containerView.addSubview(ageLabel)
        activateAgeLabelConstraints(view: ageLabel)
        
        ageField = UITextField(frame: CGRect.zero)
        ageField.placeholder = "Enter dragon's age here..."
        ageField.font = .boldSystemFont(ofSize: 17)
        ageField.borderStyle = .roundedRect
        ageField.autocorrectionType = .no
        ageField.keyboardType = .default
        ageField.clearButtonMode = .whileEditing
        ageField.contentVerticalAlignment = .center
        //textField.delegate = self
        containerView.addSubview(ageField)
        activateAgeFieldConstraints(view: ageField, anchorView: ageLabel)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 17)
        resultLabel.textAlignment = .center
        containerView.addSubview(resultLabel)
        activateResultLabelConstraints(view: resultLabel, anchorView: ageField)
        
        submitButton = UIButton(frame: CGRect.zero)
        submitButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        submitButton.setTitle("Calculate", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: resultLabel)
        
        dragonHeadsView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = dragonHeadsView
    }

    @objc func submitButtonDidPressed(sender: UIButton) {
        presenter.submitButtonDidPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func display(result: String) {
        resultLabel.text = result
    }
}

private typealias PrivateDragonHeadsViewController = DragonHeadsViewController
private extension PrivateDragonHeadsViewController {
    func activateAgeLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateAgeFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateResultLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateSubmitButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.widthAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    func activateContainerViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor, constant: -20),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
}
