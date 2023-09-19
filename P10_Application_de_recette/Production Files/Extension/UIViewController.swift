import Foundation
import UIKit

public enum MessageErrorLocalisation {
    case errorConnexionServer
    case emptyIngredient
    case errorDecode
    case emptyRecipe
}

extension UIViewController {
    
    func messageError(_ message: MessageErrorLocalisation) {

        var messageAlertVC: String

        switch message {
        case .emptyIngredient:
            messageAlertVC = Strings.errorIngredient.text
        case .errorConnexionServer:
            messageAlertVC = Strings.errorServer.text
        case .errorDecode:
            messageAlertVC = Strings.errorDecode.text
        case .emptyRecipe:
            messageAlertVC = Strings.emptyRecipe.text
        }

        let alertVC = UIAlertController(
            title: Strings.errorTitle.text,
            message: messageAlertVC,
            preferredStyle: .alert
        )

        alertVC.addAction(
            UIAlertAction(
                title: Strings.reponseMessageOk.text,
                style: .cancel,
                handler: nil
            )
        )

        return self.present(alertVC, animated: true, completion: nil)
    }
    
}
