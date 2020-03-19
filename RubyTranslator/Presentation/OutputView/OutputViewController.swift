//
//  OutputViewController.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/16.
//  Copyright © 2020 ytakano. All rights reserved.
//

import UIKit

final class OutputViewController: UIViewController {
    
    @IBOutlet private weak var beforeTextView: UITextView!
    @IBOutlet private weak var afterTextView: UITextView!
    @IBOutlet private weak var beforeTextViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var afterTextViewHeightConstraint: NSLayoutConstraint!
    
    var beforeText: String!
    var afterText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setTextView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setTextView() {
        beforeTextView.layer.cornerRadius = 5.0
        beforeTextView.clipsToBounds = true
        beforeTextView.layer.borderColor = UIColor.lightGray.cgColor
        beforeTextView.text = beforeText
        beforeTextView.sizeToFit()
        beforeTextViewHeightConstraint.constant = beforeTextView.frame.height
        
        afterTextView.layer.cornerRadius = 5.0
        afterTextView.clipsToBounds = true
        afterTextView.layer.borderColor = UIColor.lightGray.cgColor
        afterTextView.text = afterText
        afterTextView.sizeToFit()
        afterTextViewHeightConstraint.constant = afterTextView.frame.height
    }
    
    
    
}


