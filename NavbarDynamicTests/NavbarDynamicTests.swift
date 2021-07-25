//
//  NavbarDynamicTests.swift
//  NavbarDynamicTests
//
//  Created by dada on 2021/7/24.
//

import XCTest
@testable import NavbarDynamic
/*
 XCTAssert(): 判斷是否為True
 XCTAssertFalse(): 判斷是否為False
 XCTAssertEqual(): 判斷是否相同
 XCTAssertNotEqual(): 判斷是否不相同
 XCTAssertEqualWithAccuracy(): 判斷浮點數是否相等
 XCTAssertNil(): 判斷是否為空
 XCTAssertNotNil(): 判斷是否不為空
 XCTFail(): 無條件失敗
*/
class NavbarDynamicTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRequest() throws{
        let limit: Int = 20
        let offset: Int = 0
        let url = "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f18de02f-b6c9-47c0-8cda-50efad621c14&limit=\(limit)&offset=\(offset)"
        self.request(urlString: url) { (result) in
             switch result {
             case .success(let data):
                 do {
                     let decodedData = try JSONDecoder().decode(DataTaipeiModel.self,
                                                             from: data)
                     DispatchQueue.main.async(execute: {
                        print(decodedData)
                     })
                 } catch {
                     print("decode error")
                 }
             case .failure(let error):
                 print(error)
             }
         }
    }
    
    func request(urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }

}
