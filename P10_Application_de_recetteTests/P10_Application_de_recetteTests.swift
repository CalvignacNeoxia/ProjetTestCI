//
//  P10_Application_de_recetteTests.swift
//  P10_Application_de_recetteTests
//

import XCTest
@testable import P10_Application_de_recette

class RecipeServiceTests: XCTestCase {
    
    // MARK: - Properties
    
    var ingredientsList: [String]!
    
    // MARK: - Tests Life Cycle
    
    override func setUp() {
        super.setUp()
        ingredientsList = ["cocoa", "milk"]
    }
    
    // MARK: - Tests

    func testGetRecipesShouldPostFailedCallback() {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: FakeResponseData.networkError)
        let recipeSessionFake = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSessionFake)

        let expectation = XCTestExpectation(description: "Wait for queue change.")
        recipeService.getRecipes(ingredientsList: ingredientsList) { (success, recipesSearch, _) in
            XCTAssertFalse(success)
            XCTAssertNil(recipesSearch)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipesShouldPostFailedCallbackIfNoData() {
        let fakeResponse = FakeResponse(response: nil, data: FakeResponseData.incorrectData, error: nil)
        let recipeSessionFake = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSessionFake)

        let expectation = XCTestExpectation(description: "Wait for queue change.")
        recipeService.getRecipes(ingredientsList: ingredientsList) { (success, recipesSearch, _) in
            XCTAssertFalse(success)
            XCTAssertNil(recipesSearch)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipesShouldPostFailedCallbackIfIncorrectResponse() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.correctData, error: nil)
        let recipeSessionFake = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSessionFake)

        let expectation = XCTestExpectation(description: "Wait for queue change.")
        recipeService.getRecipes(ingredientsList: ingredientsList) { (success, recipesSearch, _) in
            XCTAssertFalse(success)
            XCTAssertNil(recipesSearch)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipesShouldPostFailedCallbackIfResponseCorrectAndDataNil() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: nil, error: nil)
        let recipeSessionFake = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSessionFake)

        let expectation = XCTestExpectation(description: "Wait for queue change.")
        recipeService.getRecipes(ingredientsList: ingredientsList) { (success, recipesSearch, _) in
            XCTAssertFalse(success)
            XCTAssertNil(recipesSearch)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }

    func testGetRecipesShouldPostFailedCallbackIfIncorrectData() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.incorrectData, error: nil)
        let recipeSessionFake = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSessionFake)

        let expectation = XCTestExpectation(description: "Wait for queue change.")
        recipeService.getRecipes(ingredientsList: ingredientsList) { (success, recipesSearch, _) in
            XCTAssertFalse(success)
            XCTAssertNil(recipesSearch)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }

}

