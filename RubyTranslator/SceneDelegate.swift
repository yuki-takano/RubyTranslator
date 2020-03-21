//
//  SceneDelegate.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/14.
//  Copyright © 2020 ytakano. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // HUDを正しい位置に表示するために記載
        guard let _ = (scene as? UIWindowScene) else { return }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = self.window
    }
}

