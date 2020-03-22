//
//  APIRequest.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/16.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation
import Alamofire

final class RubyRequest: APIRequestProtocol {
    typealias ResponseType = RubyResponse
    
    var parameters: Parameters? {
           return [
               "app_id": Environment.applicationId,
               "sentence": sentence,
               "output_type": Environment.gooOutputType
           ]
       }
    
    var headers: HTTPHeaders? { return nil }
    
    var method: HTTPMethod {
        return .post
    }
    
    var sentence: String
    
    init(text: String) {
        self.sentence = text
    }
    
}
