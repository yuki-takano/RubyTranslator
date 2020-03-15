//
//  InputViewController.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/14.
//  Copyright © 2020 ytakano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class InputViewController: UIInputViewController {

    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var translateButton: UIButton!
    @IBOutlet private weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var gooCreditImageView: UIImageView!
    
    private let viewModel = InputViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setCreditImageView()
        bindViewModelInput()
        bindViewModelOutput()
    }
    
    private func setupView() {
        textView.rx.didChange.bind { [weak self] _ in
            guard let self = self else { return }
            let height = self.textView.sizeThatFits(CGSize(width: self.textView.frame.width, height: CGFloat.greatestFiniteMagnitude)).height
            self.textViewHeightConstraint.constant = height
            var frame = self.textView.frame
            frame.size.height = height
            self.textView.frame = frame
        }.disposed(by: bag)
    }
    
    private func setCreditImageView() {
        gooCreditImageView.kf.setImage(with: URL(string: Environment.gooCreditImageURLString))
    }
    
    private func bindViewModelInput() {
        translateButton.rx.tap.bind { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.getRubyText(self.textView.text)
        }.disposed(by: bag)
    }
    
    private func bindViewModelOutput() {
        viewModel.rubyRelay.bind { [weak self] ruby in
            guard let ruby = ruby else { return }
            
        }.disposed(by: bag)
        
        viewModel.isLoading.bind { isLoading in
            if isLoading {
                HUD.show()
            } else {
                HUD.dismiss()
            }
        }.disposed(by: bag)
        
        viewModel.error.bind { e in
            if let error = e?.message {
                HUD.showError(error)
            }
        }.disposed(by: bag)
        
    }

}

extension InputViewController: UITextViewDelegate {
    /// どこか選択したらソフトウェアキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        }
    }
}
