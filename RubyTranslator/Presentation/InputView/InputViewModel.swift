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
    let errorString = BehaviorRelay<String?>(value: nil)
    let rubyRelay = BehaviorRelay<OutputModel?>(value: nil)
    let bag = DisposeBag()
    
    init() {}
    
    func getRubyText(_ text: String) {
        isLoading.accept(true)
        let request = RubyRequest(text: text)
        APICliant.call(request, bag, onSuccess: { [weak self] response in
            guard let ruby = response.ruby else {
                if let error = response.error {
                    self?.errorString.accept(error.message)
                }
                
                self?.isLoading.accept(false)
                return
            }
            
            self?.isLoading.accept(false)
            self?.rubyRelay.accept(ruby)
        }, onError: { [weak self] error in
            self?.errorString.accept(error.localizedDescription)
            self?.isLoading.accept(false)
        })
    }
    
}
