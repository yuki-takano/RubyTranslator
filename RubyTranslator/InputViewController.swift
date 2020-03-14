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

class InputViewController: UIInputViewController {

    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var translateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

