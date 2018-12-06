//
//  NumbersSumViewController.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/5/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol NumbersSumView: class {
    func display(result: String)
    func display(error: String)
}

class NumbersSumViewController: UIViewController, NumbersSumView {
    var presenter: NumbersSumPresenter!
    
    private var numbersSumView = UIView(frame: .zero)
    private var containerView = UIView(frame: .zero)
    private var numberLabel = UILabel(frame: .zero)
    var numberField = UITextField(frame: .zero)
    private var resultLabel = UILabel(frame: .zero)
    private var submitButton = UIButton(frame: .zero)
    
    override func loadView() {
        numbersSumView.backgroundColor = .white
        
        numberLabel.text = "Natural number:"
        numberLabel.font = .boldSystemFont(ofSize: 17)
        containerView.addSubview(numberLabel)
        activateNumberLabelConstraints(view: numberLabel)
        
        numberField.placeholder = "Enter your number here"
        numberField.font = .boldSystemFont(ofSize: 17)
        numberField.borderStyle = .roundedRect
        numberField.autocorrectionType = .no
        numberField.keyboardType = .default
        numberField.clearButtonMode = .whileEditing
        numberField.contentVerticalAlignment = .center
        containerView.addSubview(numberField)
        activateNumberFieldConstraints(view: numberField, anchorView: numberLabel)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 17)
        resultLabel.textAlignment = .center
        containerView.addSubview(resultLabel)
        activateResultLabelConstraints(view: resultLabel, anchorView: numberField)
        
        submitButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        submitButton.setTitle("Calculate", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: resultLabel)
        
        numbersSumView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = numbersSumView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        title = "Numbers sum"
    }

    @objc func submitButtonDidPressed(sender: UIButton) {
        presenter.submitButtonDidPressed()
    }
    
    func display(result: String) {
        resultLabel.textColor = .black
        resultLabel.text = result
    }
    
    func display(error: String) {
        resultLabel.textColor = .red
        resultLabel.text = error
    }
}

private typealias PrivateNumbersSumViewController = NumbersSumViewController
private extension PrivateNumbersSumViewController {
    func activateNumberLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateNumberFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
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
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
    
    func activateContainerViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor, constant: -20),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
}
