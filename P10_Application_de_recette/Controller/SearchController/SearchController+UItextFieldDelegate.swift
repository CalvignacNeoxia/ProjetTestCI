
import Foundation
import UIKit


// MARK: - TextField
extension SearchController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfieldSearch.resignFirstResponder()
        performAction()
        return true
    }
}
