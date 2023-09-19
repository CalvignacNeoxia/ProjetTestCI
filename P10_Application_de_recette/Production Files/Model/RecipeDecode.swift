import Foundation

// MARK: - RecipesSearch

struct RecipesSearch: Decodable {
    let hits: [Hit]
}

// MARK: - Hit

struct Hit: Decodable {
    var recipe: Recipe
}

struct Ingredients: Decodable {
    let ingredients: Ingredient
}

// MARK: - Recipe

struct Recipe: Decodable {
    var label: String
    var image: String?
    var url: String
    var yield: Float?
    var ingredientLines: [String]
    var totalTime: Int?
    var ingredients: [Ingredient]
}

struct Ingredient: Decodable {
    let food: String
}
