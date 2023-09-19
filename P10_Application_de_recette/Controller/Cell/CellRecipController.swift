//
//  CellRecipController.swift
//  P10_Application_de_recette
//
//  Created by charlesCalvignac on 24/01/2023.
//

import UIKit

class CellRecipController: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionRecip: UILabel!
    @IBOutlet weak var imageRecip: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var titleAndDescriptionSection: UIView!
    let recipeService = RecipeService()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.gray.withAlphaComponent(0.6).cgColor,
            UIColor.darkGray.withAlphaComponent(0.8).cgColor,
            UIColor.black.cgColor
        ]
        gradient.locations = [0, 0.25, 1]
        return gradient
    }()
    
    func setupUI(cell: CellRecipController, recipeList: [Hit], indexPath: Int) {
        cell.title.text = recipeList[indexPath].recipe.label
        cell.title.font = UIFont(name: Strings.fontMarkerFelt.text, size: 35)
        cell.configure(urlString: recipeList[indexPath].recipe.image)

        var description = String()
        recipeList[indexPath].recipe.ingredients.forEach {
            description.append(" \($0.food.capitalizingFirstLetter()),")
        }
            
        description.remove(at: description.index(before: description.endIndex))
            
        cell.descriptionRecip.text = description
        cell.descriptionRecip.font = UIFont(name: Strings.fontMarkerFelt.text, size: 15)

        cell.viewCell.backgroundColor = Colors.grayView.color
        cell.title.textColor = Colors.white.color
        cell.descriptionRecip.textColor = Colors.white.color
        
        recipeService.timeAdnLikeIsEmpty(like: recipeList[indexPath].recipe.yield ?? 0, time: recipeList[indexPath].recipe.totalTime ?? 0, positionX: cell.frame.size.width, cell: cell, delegateName: .listRecipe)
        
        cell.title.accessibilityLabel = "title recipe \(recipeList[indexPath].recipe.label)"
        cell.description.accessibilityLabel = "recipe description \(description)"
        
    }

    private func gradientFrame() {
        gradient.frame = titleAndDescriptionSection.bounds
        titleAndDescriptionSection.layer.insertSublayer(gradient, at: 0)
    }

    func configure(urlString: String?) {
        guard let urlString = urlString else {return}
        imageRecip.imageFrom(urlString: urlString)
        imageRecip.contentMode = .scaleAspectFill

        gradientFrame()
    }

}
