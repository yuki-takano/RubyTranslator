//
//  APIErrorModel.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation

struct APIErrorModel: Codable {
    let code: String
    let message: String
}

enum APIError: Error, LocalizedError {
    case unknown
}
