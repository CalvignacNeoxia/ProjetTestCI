import Foundation
import Alamofire

protocol RecipeProtocol {
    var urlStringApi: String { get }
    func request(url: URL, completionHandler: @escaping (DataResponse<Any>) -> Void)
}

extension RecipeProtocol {
    var keyAPIRecipeSearch: String {
        return Bundle.main.object(
            forInfoDictionaryKey: "API_Key_Recip"
        ) as? String ?? " "
    }
    
    var idAPIRecipeSearch: String {
        return Bundle.main.object(
            forInfoDictionaryKey: "API_Id_Recip"
        ) as? String ?? " "
    }

    var urlStringApi: String {
        return "https://api.edamam.com/api/recipes/v2?type=public&app_id=\(idAPIRecipeSearch)&app_key=\(keyAPIRecipeSearch)&q="
    }
}
