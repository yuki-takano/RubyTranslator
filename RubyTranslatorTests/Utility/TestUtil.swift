//
//  TestUtil.swift
//  RubyTranslatorTests
//
//  Created by takanoyuki on 2020/03/21.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Quick
import Nimble

final class TestUtil {
    
    func jsonFrom(filename: String) -> Data {
        let testsBundle = Bundle(for: type(of: self))
        let path = testsBundle.path(forResource: filename, ofType: "json")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        return data
    }
}
