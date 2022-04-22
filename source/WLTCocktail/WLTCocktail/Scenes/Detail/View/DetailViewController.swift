//
//  DetailViewController.swift
//  WLTCocktail
//
//  Created by Ravindran on 22/04/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var drink: DrinkModel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var measure: UILabel!
    @IBOutlet weak var instructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.navigationItem.backButtonTitle = "Back"
        self.title = drink.strDrink
        self.imageView.imageWithURL(drink.strDrinkThumb ?? "")
        name.text = drink.strDrink
        category.text = drink.strCategory
        ingredients.text = drink.getIngredients()
        measure.text = drink.getMeasures()
        instructions.text = drink.strInstructions
    }
    
}
