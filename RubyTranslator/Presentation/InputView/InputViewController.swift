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

class InputViewController: UIViewController {

    @IBOutlet private weak var textView: PlaceHolderTextView!
    @IBOutlet private weak var translateButton: UIButton!
    @IBOutlet private weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var gooCreditImageView: UIImageView!
    
    private let viewModel = InputViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setTextView()
        setCreditImageView()
        bindViewModelInput()
        bindViewModelOutput()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setTextView() {
        setTextViewButton()
        
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
    
    private func setTextViewButton() {
        let screenWidth = UIScreen.main.bounds.width
        let buttonWidth: CGFloat = 44.0
        let mergin: CGFloat = 10.0
        let accessoryView = UIView(frame: CGRect(x: screenWidth - buttonWidth - mergin, y: 0, width: 44, height: 44))
        accessoryView.backgroundColor = .white
        let closeButton = UIButton(frame: accessoryView.frame)
        closeButton.setTitle("完了", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
        closeButton.contentHorizontalAlignment = .right
        closeButton.addTarget(self, action: #selector(onClickCloseButton), for: .touchUpInside)
        accessoryView.addSubview(closeButton)
        textView.inputAccessoryView = accessoryView
    }
    
    @objc private func onClickCloseButton() {
        textView.resignFirstResponder()
    }
    
    private func bindViewModelInput() {
        translateButton.rx.tap.bind { [weak self] _ in
            guard let self = self else { return }
            
            if self.textView.text.count == 0 {
                HUD.showError("文字列を入力して下さい")
                return
            }
            
            self.viewModel.getRubyText(self.textView.text)
        }.disposed(by: bag)
    }
    
    private func bindViewModelOutput() {
        viewModel.rubyRelay.bind { [weak self] ruby in
            guard let ruby = ruby else { return }
            let storybord = UIStoryboard(name: "Output", bundle: nil)
            let outputVC = storybord.instantiateViewController(identifier: "OutputViewController") as! OutputViewController
            outputVC.beforeText = self?.textView.text
            outputVC.afterText = ruby.converted
            self?.navigationController?.pushViewController(outputVC, animated: true)
        }.disposed(by: bag)
        
        viewModel.isLoading.bind { isLoading in
            if isLoading {
                HUD.show()
            } else {
                HUD.dismiss()
            }
        }.disposed(by: bag)
        
        viewModel.errorString.bind { errorStr in
            if let e = errorStr {
                HUD.showError(e)
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
