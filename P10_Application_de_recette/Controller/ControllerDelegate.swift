import UIKit

extension SearchController: SearchDelegate {

    func togglePressButton() {
        actionButtonOrPressEnter()
    }

    internal func messageErrorDelegate(errorMessage: MessageErrorLocalisation) {
        self.animationViewOnScreen(animated: false)
        self.messageError(errorMessage)
        searchButton.isEnabled = true
    }
    
    internal func messageErrorEmptyIngredient() {
        messageError(.emptyIngredient)
    }

    internal func recipesCatch(recipesSearch: [Hit]) {
        self.recipesList = recipesSearch
        self.listRecipScreen()
    }
    
    func addAlimentsInList(ingredient: String) {
        addIngredients(with: ingredient)
        searchButton.isEnabled = true
        textfieldSearch.text = ""
    }

}

extension ListRecipController: ListRecipeDelegate {
    
    func inAppDelegateFavorite() {
        recipeList.removeAll()
        recipeList = coreDataManager.fetchFavoriteRecipe()
    }
    
    func addTimeAndLikeIfNotEmpty(dataLike: Float, dataTime: Int, positionX: CGFloat, cell: UITableViewCell)  {
        cell.addSubview(recipInformationLabel(dataLike: dataLike, dataTime: dataTime, positionX: positionX))
    }

    func recipInformationLabel(dataLike: Float, dataTime: Int?, positionX: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        
        let label = UILabel()
        label.text = " \(dataLike) 👍"
        label.font = UIFont(name: Strings.fontOptima.text, size: CGFloat(Constants.labelSize.value))
        label.textColor = Colors.white.color
        stackView.addArrangedSubview(label)
    
        let time = UILabel()
        time.text = " \(dataTime!) min ⏲️"
        time.font = UIFont(name: Strings.fontOptima.text, size: CGFloat(Constants.labelSize.value))
        time.textColor = Colors.white.color
        stackView.addArrangedSubview(time)

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center

        stackView.frame = CGRect(
            x: positionX - 100,
            y: 30,
            width: 80,
            height: 50
        )
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        stackView.backgroundColor = .gray.withAlphaComponent(1)
        
        return stackView
    }
    
}

extension DetailRecipe: DetailRecipeDelegate {
    func inAppDelegateFavorite() {
        favoriteRecip = true
    }
    
    /// Implement and add Like and Time recip
    func recipInformationLabel(dataLike: Float, dataTime: Int?) -> UIStackView {
        let stackView = UIStackView()

        let like = UILabel()
        like.text = " \(dataLike) 👍"
        like.font = UIFont(name: Strings.fontOptima.text, size: CGFloat(Constants.labelSize.value))
        like.textColor = Colors.white.color
        stackView.addArrangedSubview(like)
        
        let time = UILabel()
        time.text = " \(dataTime!) min ⏲️"
        time.font = UIFont(name: Strings.fontOptima.text, size: CGFloat(Constants.labelSize.value))
        time.textColor = Colors.white.color
        stackView.addArrangedSubview(time)

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center

        stackView.frame = CGRect(
            x: imageRecip.frame.width - 100,
            y: imageRecip.frame.height,
            width: 80,
            height: 50
        )

        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        stackView.backgroundColor = .gray.withAlphaComponent(1)

        return stackView

    }
    
    func addTimeAndLikeIfNotEmpty(dataLike: Float, dataTime: Int) {
        self.view.addSubview(
            recipInformationLabel(
                dataLike: dataLike,
                dataTime: dataTime
            )
        )
    }
    
}

