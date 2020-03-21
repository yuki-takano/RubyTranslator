//
//  ApiTests.swift
//  RubyTranslatorTests
//
//  Created by takanoyuki on 2020/03/21.
//  Copyright © 2020 ytakano. All rights reserved.
//

import Quick
import Nimble
@testable import RubyTranslator

class ApiTests: QuickSpec {
    let decoder: JSONDecoder = JSONDecoder()
    let util: TestUtil = TestUtil()
    
    override func spec() {
        describe("parse normal json") {
            context("正常なJsonデータの場合") {
                it("正常なJsonデータとしてパースが成功する事") {
                    let responseJsonData = self.util.jsonFrom(filename: "Normal")
                    var response: RubyResponse!
                    expect { response = try self.decoder.decode(RubyResponse.self, from: responseJsonData) }.toNot(throwError())
                    expect(response.ruby).toNot(beNil())
                    expect(response.ruby?.rubyText).to(equal("かんじがまざっているぶんしょう"))
                    expect(response.ruby?.outputType).to(equal("hiragana"))
                }
            }
        }
        
        describe("parse error json") {
            context("異常系のJsonデータの場合") {
                it("異常系のJsonデータとしてパースが成功する事") {
                    let responseJsonData = self.util.jsonFrom(filename: "Error")
                    var response: RubyResponse!
                    expect { response = try self.decoder.decode(RubyResponse.self, from: responseJsonData) }.toNot(throwError())
                    expect(response.error).notTo(beNil())
                    expect(response.error?.code).to(equal(400))
                    expect(response.error?.message).to(equal("Invalid JSON"))
                }
            }
        }
    }
}
