//
//  PlaceHolderTextView.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/20.
//  Copyright © 2020 ytakano. All rights reserved.
//

import UIKit

@IBDesignable class PlaceHolderTextView: UITextView {

    @IBInspectable private var placeHolder: String = "" {
        willSet {
            self.placeHolderLabel.text = newValue
            self.placeHolderLabel.sizeToFit()
        }
    }

    private lazy var placeHolderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 5.0, y: 5.0, width: 0.0, height: 0.0))
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = self.font
        label.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)
        self.addSubview(label)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        changePlaceHolderAlpha()
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }

    private func changePlaceHolderAlpha() {
        self.placeHolderLabel.alpha = (self.placeHolder.isEmpty || !self.text.isEmpty) ? 0.0 : 1.0
    }

    @objc private func textChanged(notification: NSNotification?) {
        changePlaceHolderAlpha()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
