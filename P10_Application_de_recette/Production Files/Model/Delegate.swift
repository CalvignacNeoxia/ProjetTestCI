import Foundation
import UIKit

protocol SearchDelegate: AnyObject {

    func messageErrorDelegate(errorMessage: MessageErrorLocalisation)
    func recipesCatch(recipesSearch: [Hit])
    func addAlimentsInList(ingredient: String)
    func togglePressButton()
    func messageErrorEmptyIngredient()
}

protocol ListRecipeDelegate: AnyObject {
    func inAppDelegateFavorite()
    func recipInformationLabel(dataLike: Float, dataTime: Int?, positionX: CGFloat) -> UIStackView
    func addTimeAndLikeIfNotEmpty(dataLike: Float, dataTime: Int, positionX: CGFloat, cell: UITableViewCell)
}

protocol DetailRecipeDelegate: AnyObject {
    func inAppDelegateFavorite()
    func recipInformationLabel(dataLike: Float, dataTime: Int?) -> UIStackView
    func addTimeAndLikeIfNotEmpty(dataLike: Float, dataTime: Int)
}
