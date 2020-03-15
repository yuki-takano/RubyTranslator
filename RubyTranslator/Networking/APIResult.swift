//
//  APIResult.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/16.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation

enum APIResult {
    case success(Codable)
    case failure(Error)
}
