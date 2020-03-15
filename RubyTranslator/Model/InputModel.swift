//
//  InputModel.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation

struct InputModel: Codable {
    let appId: String
    let sentence: String
    let outputType: String
}
