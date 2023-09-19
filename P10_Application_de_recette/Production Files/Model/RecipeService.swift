import Foundation
import Alamofire

enum ErrorCode: Int {
    case good
    case networkError
    case decodeError
    case recipeEmpty
}

final class RecipeService {
    
    private let recipeSession: RecipeProtocol
    weak var searchDelegate: SearchDelegate?
    weak var listRecipeDelegate: ListRecipeDelegate?
    weak var detailRecipeDelegate: DetailRecipeDelegate?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    init(recipeSession: RecipeProtocol = RecipeSession()) {
        self.recipeSession = recipeSession
    }
}

// MARK: - SearchDelegate

extension RecipeService {

    func getRecipe(ingredientsList: [String]) {
        getRecipes(ingredientsList: ingredientsList) { (success, recipesSearch, returnMessage) in
            if success {
                guard let recipesSearch = recipesSearch else { return }
                print("@@@ recipesSearch.hits = \(recipesSearch.hits)")
                self.searchDelegate?.recipesCatch(recipesSearch: recipesSearch.hits)
            } else {
                switch returnMessage {
                case .decodeError:
                    self.searchDelegate?.messageErrorDelegate(errorMessage:.errorDecode)
                case .networkError:
                    self.searchDelegate?.messageErrorDelegate(errorMessage: .errorConnexionServer)
                case .recipeEmpty:
                    self.searchDelegate?.messageErrorDelegate(errorMessage: .emptyRecipe)
                case .good:
                    break
                }
            }
        }
        
    }

    
    /// network call to get the recipes
    func getRecipes(ingredientsList: [String], completionHandler: @escaping (Bool, RecipesSearch?, ErrorCode) -> Void) {
        
        guard let url = createRecipeSearchUrl(ingredientsList: ingredientsList) else { return }

        recipeSession.request(url: url) { responseData in
            guard responseData.response?.statusCode == 200 else {
                completionHandler(false, nil, .good)
                return
            }

            guard let data = responseData.data else {
                completionHandler(false, nil, .networkError)
                return
            }

            guard let recipeSearch = try? JSONDecoder().decode(RecipesSearch.self, from: data) else {
                print("@@@ ")
                print("@@@ getRecipes error decode ")
                completionHandler(false, nil, .decodeError)
                return
            }

            if recipeSearch.hits.isEmpty {
                print("@@@ getRecipes empty")
                completionHandler(false, nil, .recipeEmpty)
                return
            }

            completionHandler(true, recipeSearch, .good)

        }
    }

    private func createRecipeSearchUrl(ingredientsList: [String]) -> URL? {
        let ingredientUrl = ingredientsList.joined(separator: ",")
        guard let url = URL(string: recipeSession.urlStringApi + ingredientUrl) else { return nil }
        return url
    }

    func actionButtonOrPressEnter(buttonHasBeenPressed: Bool) {
        if !buttonHasBeenPressed {
            searchDelegate?.togglePressButton()
        }
    }
    
    func addElementsInList(ingredient: String?) {
        guard var ingredient = ingredient else {return}

        ingredient = ingredient.trimmingCharacters(in: .whitespacesAndNewlines)

        if !ingredient.isEmpty && !ingredient.replacingOccurrences(of: " ", with: "").isEmpty {
            searchDelegate?.addAlimentsInList(ingredient: ingredient)
            
        } else {
            searchDelegate?.messageErrorEmptyIngredient()
        }
    }
    
}

// MARK: - ListRecipeDelegate
extension RecipeService {
    func isFavoriteRecipe(delegateName: DelegateName) {
        if appDelegate.favorite {
            delegateName == .listRecipe ? listRecipeDelegate?.inAppDelegateFavorite() : detailRecipeDelegate?.inAppDelegateFavorite()
        }
    }
}

// MARK: - DetailRecipeDelegate
extension RecipeService {
    
    func timeAdnLikeIsEmpty(like: Float, time: Int, positionX: CGFloat, cell: UITableViewCell, delegateName: DelegateName) {
        if like != 0 || time != 0 {
            delegateName == .detailRecipe ? detailRecipeDelegate?.addTimeAndLikeIfNotEmpty(dataLike: like, dataTime: time) : listRecipeDelegate?.addTimeAndLikeIfNotEmpty(dataLike: like, dataTime: time, positionX: positionX, cell: cell) 
        }
    }
    
}

enum DelegateName {
    case searchController
    case listRecipe
    case detailRecipe
}
