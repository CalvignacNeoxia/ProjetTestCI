
import Foundation
import UIKit

// MARK: - Table View DataSource
extension ListRecipController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath as IndexPath) as? CellRecipController

        guard let cell = cell else {return UITableViewCell()}

        cell.setupUI(cell: cell, recipeList: recipeList, indexPath: indexPath.row)

        return cell
      }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       200
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeList.count
    }
}

// MARK: - Table View Delegate
extension ListRecipController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let vc = storyboard?.instantiateViewController(withIdentifier: "DetailRecipeController") as? DetailRecipe
      
      var description = String()
      recipeList[indexPath.row].recipe.ingredients.forEach {
          description.append(" \($0.food.capitalizingFirstLetter()),")
      }
      description.removeLast()

      vc?.label = recipeList[indexPath.row].recipe.label
      vc?.yield = recipeList[indexPath.row].recipe.yield ?? 0
      vc?.totalTime = recipeList[indexPath.row].recipe.totalTime ?? 0
      vc?.url = recipeList[indexPath.row].recipe.url
      vc?.ingredientLines = recipeList[indexPath.row].recipe.ingredientLines
      vc?.image = recipeList[indexPath.row].recipe.image ?? ""
      vc?.ingredients = description

      guard let vc = vc else {return}
      self.navigationController?.pushViewController(vc, animated: true)
  }
}


