//
//  ListRecipTableViewCell.swift
//  P10_Application_de_recette
//
//  Created by charlesCalvignac on 23/01/2023.
//

import UIKit

class CellIngredientController: UITableViewCell {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
