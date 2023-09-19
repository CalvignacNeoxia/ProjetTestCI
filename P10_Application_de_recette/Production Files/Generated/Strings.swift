// This file allows to summarize all the strings that are used in the project

enum Strings: String {

    // Title
    case titleRecip

    // error messages
    case reponseMessageOk
    case errorTitle
    case error
    case errorServer
    case errorDecode
    case emptyRecipe
    case errorIngredient
    case messageEmptyTableViewRecip

    // Nav Bar
    case starSelected
    case starUnselected

    // lottie animation name
    case loading

    // ui Text
    case placeholderText
    case fontOptima
    case fontMarkerFelt

    var text: String {
        switch self {
        case .titleRecip: return "RECIPLEASE"
        case .reponseMessageOk: return "OK"
        case .errorTitle: return "Error !"
        case .error: return "ERROR"
        case .errorServer: return "Nous n'avons pas réussi à établir une conexion avec le serveur"
        case .errorDecode: return "La liste des recettes ne peut être affiché suite à un problème avec notre base de donné "
        case .emptyRecipe: return "La base de donné ne retourne aucune recette pour les ingrédients souhaités"
        case .errorIngredient: return "Veillez séléctionner un ingredient"
        
        case .loading: return "loading"
            
        case .placeholderText: return "Votre text"
        case .fontOptima: return "Optima"
        case .fontMarkerFelt: return "Marker felt"

        case .starSelected: return "star.fill"
        case .starUnselected: return "star"

        case .messageEmptyTableViewRecip: return
            """
            Votre liste de favoris est vide.

            Ici vous pouvez enregistrer vos recettes préférées pour les avoir sur vos tout le temps, même hors ligne.

            Pour avoir cette chance, appuyé sur l'étoile en haut à droite des recettes ⭐ pour l'enregistrer.
            """
        }
    }
}
