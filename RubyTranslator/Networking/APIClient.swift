//
//  APIClient.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/16.
//  Copyright © 2020 ytakano. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

struct APICliant {

    private static let successRange = 200..<400
    private static let contentType = ["application/json"]

    static func call<T, V>(_ request: T, _ disposeBag: DisposeBag, onSuccess: @escaping (V) -> Void, onError: @escaping (Error) -> Void)
        where T: APIRequestProtocol, V: Codable, T.ResponseType == V {

            _ = observe(request)
                .observeOn(MainScheduler.instance)
                .subscribe(onSuccess: { onSuccess($0) },
                           onError: { onError($0) })
                .disposed(by: disposeBag)
    }

    static func observe<T, V>(_ request: T) -> Single<V>
        where T: APIRequestProtocol, V: Codable, T.ResponseType == V {

            return Single<V>.create { observer in
                let calling = callForData(request) { response in
                    switch response {
                    //※ successなので強制キャストできる
                    case .success(let result): observer(.success(result as! V))
                    case .failure(let error): observer(.error(error))
                    }
                }

                return Disposables.create() { calling.cancel() }
            }
    }

    // Alamofire呼び出し部分
    private static func callForData<T, V>(_ request: T, completion: @escaping (APIResult) -> Void) -> DataRequest
        where T: APIRequestProtocol, V: Codable, T.ResponseType == V {
            
            return APICliant.request(request).responseJSON { response in
                guard let data = response.data else { return completion(.failure(APIError.unknown))}
                do {
                    let data = try JSONDecoder().decode(V.self, from: data)
                    return completion(.success(data))
                } catch let error {
                    return completion(.failure(error))
                }

            }
    }

    // Alamofireのメソッドのみ切り出した部分
    private static func request<T>(_ request: T) -> DataRequest
        where T: APIRequestProtocol {
            
            AF.request(request)
               .validate(statusCode: successRange)
               .validate(contentType: contentType)
    }
}
