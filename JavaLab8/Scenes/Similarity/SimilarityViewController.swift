//
//  SimilarityViewController.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol SimilarityView: class {
    func display(result: String)
}

class SimilarityViewController: UIViewController, SimilarityView {
    var presenter: SimilarityPresenter!
    
    private var similarityView = UIView(frame: .zero)
    private var containerView = UIView(frame: .zero)
    private var numberLabel = UILabel(frame: .zero)
    private var numberField = UITextField(frame: .zero)
    private var resultLabel = UILabel(frame: .zero)
    private var submitButton = UIButton(frame: .zero)
    
    override func loadView() {
        similarityView.backgroundColor = .white
        
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
        submitButton.setTitle("Check", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: resultLabel)
        
        similarityView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = similarityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        title = "Similarity"
    }
    
    @objc func submitButtonDidPressed() {
        
    }
    
    func display(result: String) {
        
    }
}

private typealias PrivateSimilarityViewController = SimilarityViewController
private extension PrivateSimilarityViewController {
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
