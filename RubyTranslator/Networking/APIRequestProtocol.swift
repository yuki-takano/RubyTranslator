//
//  APIRequestProtocol.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/16.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRequestProtocol: URLRequestConvertible {
    associatedtype ResponseType
    
    var parameters: Parameters? { get }
    var encoding: JSONEncoding { get }
    var url: URL { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
}

extension APIRequestProtocol {
    var encoding: JSONEncoding {
        return JSONEncoding.default
    }
    
    var url: URL {
        // 存在が保証されているためフォースアンラップする
        return try! Environment.gooURL.asURL()
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = TimeInterval(20)
        if let parameters = parameters {
            urlRequest = try encoding.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
