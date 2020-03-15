//
//  APIResponse.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation

struct RubyResponse: Codable {
    let ruby: OutputModel?
    let error: APIErrorModel?
    
    enum CodingKeys: String, CodingKey {
        case error
    }
    
    init(from decoder: Decoder) throws {
        ruby = try? OutputModel(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        error = try container.decodeIfPresent(APIErrorModel.self, forKey: .error)
    }
}
