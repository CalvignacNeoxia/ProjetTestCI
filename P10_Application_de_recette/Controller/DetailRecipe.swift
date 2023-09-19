import UIKit
import CoreData

// MARK: - DetailRecipt
class DetailRecipe: UIViewController {

    @IBOutlet weak var imageRecip: UIImageView!
    @IBOutlet weak var ingredientsList: UITextView!

    var favoriteRecip = false
    internal var ingredientLines = [String]()
    internal var totalTime = Int()
    internal var yield = Float()
    internal var label = String()
    internal var url = String()
    internal var image = String()
    internal var ingredients = String()
    var recipeService = RecipeService()
    let coreDataManager = CoreDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageUrlString = image

        imageRecip.imageFrom(urlString: imageUrlString)
    
        imageRecip.contentMode = .scaleToFill

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageRecip.reloadInputViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Task {
            await checkFavoriteCoreData()
        }
    }

}

// MARK: - Setup
private extension DetailRecipe {

    func setup() {

        // UI implementation Nav bar
        let navBar = NavBar()
        navigationItem.titleView = navBar.setupNavigationBar()

        // UI implementation Tab bar
        let tabBar = TabBar()
        view.addSubview(tabBar.setupUITabBarItemBorder())
        recipeService.detailRecipeDelegate = self

        recipeService.timeAdnLikeIsEmpty(
            like: yield,
            time: totalTime,
            positionX: 0,
            cell: UITableViewCell(),
            delegateName: .detailRecipe
        )

        nameRecip()
        listIngredient()
        setupUITabBarItemBorder()
        setupNavigationBar()
    }
    
    func setupAcce() {
        ingredientsList.accessibilityLabel = "Ingredient recipe \(String(describing: ingredientsList))"
    }
    
    

}

private extension DetailRecipe {

    func checkFavoriteCoreData() async {
        recipeService.isFavoriteRecipe(delegateName: .detailRecipe)
        let test = await coreDataManager.checkIfRecipeIsFavorite( label: label)

        toggleFavoriteButton(favorite: test)
    }
}

// MARK: - Button Action
private extension DetailRecipe {

    @IBAction func getDirectionButton(_ sender: Any) {
        let vc = DetailRecipWebView()
        vc.urlString = url
        navigationController?.present(vc, animated: true)
    }

    @objc func buttonTapped() {
        Task {
            await favoriteButtonClick(stateFavoriteButton: favoriteRecip)
        }
    }

    func favoriteButtonClick(stateFavoriteButton: Bool) async {
        if !favoriteRecip {
            await coreDataManager.newRecipeSaved(label: label, yield: yield, image: image, url: url, totalTime: totalTime, ingredients: ingredients, ingredientLines: ingredientLines)
        } else {
            await coreDataManager.removeRecipeFromFavorite(label: label)
        }
        toggleFavoriteButton(favorite: !favoriteRecip)
    }
    
}

// MARK: - UI Implementation
private extension DetailRecipe {

    // MARK: Nav Bar item
    func setupNavigationBar() {

        /// Navigation Item Title
        let label = UILabel()
        label.text = Strings.titleRecip.text
        label.font = UIFont(
            name: Strings.fontMarkerFelt.text,
            size: CGFloat(Constants.titleSize.value)
        )
        label.textColor = .white

        navigationItem.titleView = label

        /// Navigation Item Right Button
        let myImage = UIImage(systemName: favoriteRecip ?
                              Strings.starSelected.text :
                                Strings.starUnselected.text)?
            .resizeImageTo(size: CGSize(
                width: Int(Constants.starWidth.value),
                height: Int(Constants.starHeight.value)))

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: myImage,
            style: .done,
            target: self,
            action: #selector(buttonTapped)
        )

        navigationItem.rightBarButtonItem?.tintColor = .white

    }

    func toggleFavoriteButton(favorite: Bool) {
        favoriteRecip = favorite

        navigationItem.rightBarButtonItem?.image = UIImage(
            systemName: favorite ? Strings.starSelected.text :
                Strings.starUnselected.text)?
            .resizeImageTo(size: CGSize(
                width: Int(Constants.starWidth.value),
                height: Int(Constants.starHeight.value)
            ))
    }

    /// Implement and add Name Recip
    func nameRecip() {
        let name = UILabel()
        name.accessibilityLabel = "recipe name \(label)"
        name.text = label
        name.textColor = .white
        name.font = UIFont(name: Strings.fontOptima.text, size: CGFloat(Constants.titleSize.value))
        name.backgroundColor = .gray.withAlphaComponent(0.7)
        name.textAlignment = .center
        imageRecip.addSubview(name)
        name.numberOfLines = 0
        name.frame = CGRect(
            x: 0,
            y: imageRecip.frame.height - CGFloat(Constants.heightNameRecip.value),
            width: CGFloat(Constants.widthNameRecip.value),
            height: CGFloat(Constants.heightNameRecip.value)
        )

    }
    
    func listIngredient() {
        ingredientLines.forEach{
            ingredientsList.text.append("\n\n - \($0)")
        }
        ingredientsList.font = UIFont(name: Strings.fontMarkerFelt.text, size: 18)
    }

    // MARK: Tab Bar item
    func setupUITabBarItemBorder() {

        let tabBarItemRightBorder = UILabel()
        tabBarItemRightBorder.frame = CGRect(
            x: 0,
            y: UIScreen.main.bounds.height - 40,
            width: UIScreen.main.bounds.width / 2,
            height: 40
        )
        tabBarItemRightBorder.layer.addWaghaBorder(
            edge: .right,
            color: .gray,
            thickness: 10
        )
        view.addSubview(tabBarItemRightBorder)
    }

}
