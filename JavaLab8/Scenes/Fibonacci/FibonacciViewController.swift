//
//  FibonacciViewController.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol FibonacciView: class {
    
}

class FibonacciViewController: UIViewController, FibonacciView {
    var presenter: FibonacciPresenter!
    
    private var fibonacciView = UIView(frame: .zero)
    private var containerView = UIView(frame: .zero)
    private var numberLabel = UILabel(frame: .zero)
    private var numberField = UITextField(frame: .zero)
    private var submitButton = UIButton(frame: .zero)
    private var resultCollectionLayout = UICollectionViewFlowLayout()
    private lazy var resultCollectionView = UICollectionView(frame: .zero, collectionViewLayout: resultCollectionLayout)
    private var fibonacciDataSource = FibonacciDataSource()
    
    override func loadView() {
        fibonacciView.backgroundColor = .white
        
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
        
        submitButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        submitButton.setTitle("Find", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: numberField)
        
        fibonacciView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        resultCollectionLayout.scrollDirection = .vertical
        resultCollectionView.dataSource = fibonacciDataSource
        resultCollectionView.delegate = self
        resultCollectionView.backgroundColor = .clear
        resultCollectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: "resultCell")
        fibonacciView.addSubview(resultCollectionView)
        activateResultCollectionViewConstraints(view: resultCollectionView, anchorView: submitButton)
        
        view = fibonacciView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        title = "Fibonacci"
    }
    
    @objc func submitButtonDidPressed(sender: UIButton) {
        presenter.submitButtonDidPressed()
    }
}

extension FibonacciViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 30)
    }
}

private typealias PrivateFibonacciViewController = FibonacciViewController
private extension PrivateFibonacciViewController {
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
            view.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 20),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
    
    func activateResultCollectionViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor, constant: -20),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
}
