import Foundation
import UIKit
import Alamofire
import CoreData

// TODO: Class Nav 

class ListRecipController: UIViewController {

    @IBOutlet weak var tableViewRecip: UITableView!
    @IBOutlet weak var messageEmptyListRecip: UILabel!
    let coreDataManager = CoreDataManager()
    var recipeList = [Hit]()
    var recipeService = RecipeService()
    
    override internal func viewDidLoad() {
        super.viewDidLoad()

        // UI implementation Nav bar
        let navBar = NavBar()
        navigationItem.titleView = navBar.setupNavigationBar()

        // UI implementation Tab bar
        let tabBar = TabBar()
        view.addSubview(tabBar.setupUITabBarItemBorder())
        
        recipeService.listRecipeDelegate = self

        reloadData()

        setupVar()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupView()
        recipeService.isFavoriteRecipe(delegateName: .listRecipe)
        reloadData()

    }

    private func reloadData() {
        DispatchQueue.main.async {
            self.setupView()
            self.tableViewRecip.reloadData()
        }
    }

}

private extension ListRecipController {

    func setupView() {
        tableViewRecip.isHidden = recipeList.isEmpty
        messageToAddFavorite(visible: recipeList.isEmpty)
    }

    func setupVar() {
        tableViewRecip.delegate = self
        tableViewRecip.dataSource = self
        tableViewRecip.register(UINib(nibName: "CellRecipView", bundle: nil), forCellReuseIdentifier: "cell")
        tableViewRecip.reloadData()
    }

}

private extension ListRecipController {

    func messageToAddFavorite(visible: Bool) {
        messageEmptyListRecip.isHidden = !visible
        messageEmptyListRecip.text = Strings.messageEmptyTableViewRecip.text
    }

}
