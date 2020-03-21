//
//  OutputModel.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation

struct OutputModel: Codable {
    let requestId: String
    let outputType: String
    let converted: String
    // convertedは単語間に半角スペースが入っているため、スペースを覗いた文字列を表示に使う
    var rubyText: String {
        converted.replacingOccurrences(of: " ", with: "")
    }
    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case outputType = "output_type"
        case converted
    }
    
}

