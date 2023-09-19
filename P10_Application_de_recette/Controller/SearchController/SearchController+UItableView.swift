
import Foundation
import UIKit

// MARK: - Table View DataSource
extension SearchController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellIngredientController

      guard let cell = cell else { return UITableViewCell()}

      cell.textLabel?.textColor = .white
      cell.textLabel?.font = UIFont(name: Strings.fontMarkerFelt.text, size: CGFloat(Constants.titleSize.value))
      cell.textLabel?.text = " - \(arrayIngredient[indexPath.row])"
      cell.backgroundColor = .clear
      cell.btn.tag = indexPath.row
      cell.btn.addTarget(self, action: #selector(crossButtonTap(_:)), for: .touchUpInside)

      return cell
  }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayIngredient.count
    }
}

// MARK: - Table View Delegate
extension SearchController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let indexPath = tableView.indexPathForSelectedRow
    guard let indexPath = indexPath else {return}
      _ = tableView.cellForRow(at: indexPath)
  }

}
