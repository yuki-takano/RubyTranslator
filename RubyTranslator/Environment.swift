//
//  Environment.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation

public final class Environment {
    // ルビに変換するためのAPI
    static let gooURL = "https://labs.goo.ne.jp/api/hiragana"
    
    // ひらがなに変換するために設定
    static let gooOutputType = "hiragana"
    
    // gooのAPIを使う上で表示が必要なクレジット画像
    static let gooCreditImageURLString = "http://u.xgoo.jp/img/sgoo.png"
    
    // gooのAPIに渡すID
    static let applicationId = "7963217ee7d868527e75e1cf665ba9d3b6b5f5d9b11096d68891f911198469ad"
}
