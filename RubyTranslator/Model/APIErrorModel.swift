//
//  APIErrorModel.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation

struct APIErrorModel: Codable {
    let code: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, message
    }
}

enum APIError: Error, LocalizedError {
    case unknown
}
