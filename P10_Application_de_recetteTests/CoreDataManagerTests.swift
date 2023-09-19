
import XCTest
@testable import P10_Application_de_recette

final class CoreDataManagerTests: XCTestCase {
    
    // MARK: - Properties

    var coreDataManager: CoreDataManager!

    // MARK: - Tests Life Cycle

    override func setUp() {
        super.setUp()
        self.coreDataManager = CoreDataManager(coreDataStack: CoreDataStack(modelName: "P10_Application_de_recette",
                                                                            useInMemoryStore: true))
    }

    override func tearDown() {
        super.tearDown()
        coreDataManager = nil
    }

    // MARK: - Tests

    func testAddRecipeMethods_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() async {
        
        /// create recipe
        await coreDataManager.newRecipeSaved(label: "My Recipe", yield: 16, image: "https://www.edamam.com/web-img/de7/de75049edc890303d8fd1293d35938b2.jpg", url: "http://www.seriouseats.com/recipes/2009/09/adult-brownie-chocolate-salt-coffee-andronicos-supermarket-san-francisco-recipe.html", totalTime: 0, ingredients: "", ingredientLines: [""])
        
        guard let lastRecipeSaved = coreDataManager.recipes.last?.recipe else {return}

        XCTAssertTrue(!coreDataManager.recipes.isEmpty)
        XCTAssertTrue(lastRecipeSaved.label == "My Recipe")
        XCTAssertTrue(lastRecipeSaved.yield == 16)
        XCTAssertTrue(lastRecipeSaved.totalTime == 0)
        XCTAssertTrue(lastRecipeSaved.image == "https://www.edamam.com/web-img/de7/de75049edc890303d8fd1293d35938b2.jpg")
        XCTAssertTrue(lastRecipeSaved.url == "http://www.seriouseats.com/recipes/2009/09/adult-brownie-chocolate-salt-coffee-andronicos-supermarket-san-francisco-recipe.html")
     
        /// check if recipe is save in favorite
        let recipeIsFavorite = await coreDataManager.checkIfRecipeIsFavorite(label: "My Recipe")
        XCTAssertTrue(coreDataManager.recipes.count > 0)
        XCTAssertTrue(recipeIsFavorite)
    }

    func testDeleteRecipeMethod_WhenAnEntityIsCreated_ThenShouldBeCorrectlyDeleted() async {

        /// add recipes
        await coreDataManager.newRecipeSaved(label: "My Recipe One", yield: 1, image: "", url: "http://www.seriouseats.com/recipes/2009/09/adult-brownie-chocolate-salt-coffee-andronicos-supermarket-san-francisco-recipe.html", totalTime: 10, ingredients: "ingredients", ingredientLines: ["ingredient"])
        
        await coreDataManager.newRecipeSaved(label: "My Recipe Two", yield: 1, image: "", url: "http://www.seriouseats.com/recipes/2009/09/adult-brownie-chocolate-salt-coffee-andronicos-supermarket-san-francisco-recipe.html", totalTime: 10, ingredients: "ingredients", ingredientLines: ["ingredient"])
        
        /// remove recipe
        await coreDataManager.removeRecipeFromFavorite(label: "My Recipe One")

        /// check if recipe are in favorite
        let recipeIsFavoriteOne = await coreDataManager.checkIfRecipeIsFavorite(label: "My Recipe One")
        XCTAssertFalse(recipeIsFavoriteOne)
        
        let recipeIsFavoriteTwo = await coreDataManager.checkIfRecipeIsFavorite(label: "My Recipe Two")
        XCTAssertTrue(recipeIsFavoriteTwo)

        XCTAssertFalse(coreDataManager.recipes.isEmpty)
    }

/*
    func testDeleteVoidRecipesMethod_WhenAnEntityIsCreated_ThenShouldBeCorrectlyAllDeleted() async {
        
        /// create new recipes
        await coreDataManager.newRecipeSaved(label: "", yield: 0, image: "", url: "", totalTime: 0, ingredients: "", ingredientLines: [""])
        await coreDataManager.newRecipeSaved(label: "Test", yield: 0, image: "", url: "", totalTime: 0, ingredients: "", ingredientLines: [""])
        
        /// remove the not void recipe
        await coreDataManager.removeRecipeFromFavorite(label: "Test")

        /// check if the void recipe is delete
        let isFavoriteRecipe = await coreDataManager.checkIfRecipeIsFavorite(label: "")
        XCTAssertFalse(isFavoriteRecipe)
    }
*/
    
}
