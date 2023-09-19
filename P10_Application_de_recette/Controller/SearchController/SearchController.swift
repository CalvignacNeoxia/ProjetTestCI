import Foundation
import UIKit
import Lottie

// MARK: - SearchController
class SearchController: UIViewController {

    @IBOutlet weak var textfieldSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    var buttonHasBeenPressed = false
    var recipesList = [Hit]()

    let animationView = AnimationView(
        animation: Animation.named(Strings.loading.text)
    )

    private let recipeService = RecipeService()
    var arrayIngredient = [String]()

    override internal func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupAccessibility()
    }

    override func viewWillAppear(_ animated: Bool) {
        searchButton.isEnabled = !arrayIngredient.isEmpty
        animationViewOnScreen(animated: false)
    }
}

// MARK: - Setup
private extension SearchController {

    func setup() {
        // UI implementation Nav bar
        let navBar = NavBar()
        navigationItem.titleView = navBar.setupNavigationBar()

        // UI implementation Tab bar
        let tabBar = TabBar()
        view.addSubview(tabBar.setupUITabBarItemBorder())
        
        textfieldSearch.delegate = self
        searchButton.isEnabled = false

        setUpLottieAnimation()

        tableView.register(UINib(nibName: "CellIngredientView", bundle: nil), forCellReuseIdentifier: "cell")
        
        recipeService.searchDelegate = self
    }
    
    func setupAccessibility() {
        textfieldSearch.accessibilityLabel = "bar for adding igredients from your fridge"
        searchButton.accessibilityLabel = "button to send a request to find recipe after add ingredient in the list"
        tableView.accessibilityLabel = "list of ingredients in your fridge"
        addButton.accessibilityLabel = "button for adding ingredients to the list"
        clearButton.accessibilityLabel = "button to remove all elements in the list"
    }

}

extension SearchController {
    public func getRecipes() {
        searchButton.isEnabled = false
        print("@@@ getRecipes : arrayIngredient = \(arrayIngredient)")
        recipeService.getRecipe(ingredientsList: arrayIngredient)
    }
}


// MARK: - Lottie Animation
extension SearchController {

    private func setUpLottieAnimation() {
        // MARK: Animation lottie
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        animationViewOnScreen(animated: false)
    }

    func animationViewOnScreen(animated: Bool) {

        let size: CGFloat = animated ? 200 : 0
        animationView.frame = CGRect(
            x: (UIScreen.main.bounds.maxX / 2) - 100,
            y: UIScreen.main.bounds.maxY / 2 - 100,
            width: size,
            height: size
        )
    }

    func performAction() {
        recipeService.actionButtonOrPressEnter(buttonHasBeenPressed: buttonHasBeenPressed)
    }

}

// MARK: - Action Button
extension SearchController {

    @IBAction private func addButton(_ sender: Any) {
        actionButtonOrPressEnter()
    }

    @IBAction private func clearButton(_ sender: Any) {
        arrayIngredient.removeAll()
        searchButton.isEnabled = false
        tableView.reloadData()
    }

    @objc func crossButtonTap(_ sender: UIButton) {
        arrayIngredient.remove(at: sender.tag)
        searchButton.isEnabled = !arrayIngredient.isEmpty
        tableView.reloadData()
    }

    @IBAction private func searchRecipeButton(_ sender: Any) {
        self.animationViewOnScreen(animated: true)
        animationView.play()
        getRecipes()
    }

}

// MARK: - UI Implementation
extension SearchController {

    func actionButtonOrPressEnter() {
        recipeService.addElementsInList(ingredient: textfieldSearch.text)
    }

    func addIngredients(with ingredient: String) {
        arrayIngredient.insert(ingredient, at: arrayIngredient.count)
        tableView.reloadData()
    }

}

// MARK: Segue
extension SearchController {
    
    func listRecipScreen() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListRecipController") as! ListRecipController
        vc.recipeList = recipesList
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
