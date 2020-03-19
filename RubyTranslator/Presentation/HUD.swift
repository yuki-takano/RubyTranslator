//
//  HDU.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation
import SVProgressHUD

struct HUD {
    private init() {}
    
    static func setDefaultSettings() {
        SVProgressHUD.setRingThickness(2)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundLayerColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09918129281))
        SVProgressHUD.setForegroundColor(.gray)
    }
    
    static func show() {
        SVProgressHUD.show()
    }
    
    static func dismiss() {
        SVProgressHUD.dismiss(withDelay: 3)
    }
    
    static func showError(_ text: String) {
        SVProgressHUD.showError(withStatus: text)
        SVProgressHUD.dismiss(withDelay: 3)
    }
}
