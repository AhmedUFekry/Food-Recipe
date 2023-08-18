//
//  Recipes_AppTests.swift
//  Recipes AppTests
//
//  Created by Ahmed Fekry on 03/08/2023.
//

import XCTest
@testable import Recipes_App

final class Recipes_AppTests: XCTestCase {

    let recipesList = RecipsViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNetworkManager() {
        let exp = expectation(description: "wating for API...")
        recipesList.getAllRecips(url: "https://api.npoint.io/43427003d33f1f6b51cc")
        
        recipesList.bindingRecips = { [self] in
            if recipesList.ObservableRecips?.count ?? 0 >= 1 {
                
                XCTAssertTrue(true)
                exp.fulfill()
            }else {
                
                XCTFail("No Recipes Found")
                
            }
            
        }
        waitForExpectations(timeout: 10)
              
    }

    

}
