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
    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case outputType = "output_type"
        case converted
    }
    
}

