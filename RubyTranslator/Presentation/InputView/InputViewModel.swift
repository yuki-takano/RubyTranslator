//
//  InputViewModel.swift
//  RubyTranslator
//
//  Created by takanoyuki on 2020/03/15.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class InputViewModel {
    let isLoading = BehaviorRelay<Bool>(value: false)
    let error = BehaviorRelay<APIErrorModel?>(value: nil)
    let rubyRelay = BehaviorRelay<OutputModel?>(value: nil)
    let bag = DisposeBag()
    
    init() {}
    
    func getRubyText(_ text: String) {
        let request = RubyRequest(text: text)
        APICliant.call(request, bag, onSuccess: { response in
            print(response)
            
        }, onError: { error in
            print(error)
        })
    }
    
}
