//
//  SearchModel.swift
//  WLTCocktail
//
//  Created by Ravindran on 22/04/22.
//

import Foundation

struct SearchModel: Codable {
    var drinks: [DrinkModel]?
    
    enum CodingKeys: String, CodingKey {
        case drinks
    }
}

struct DrinkModel: Codable {
    var idDrink, strDrink: String?
    var strTags: String?
    var strCategory, strIBA, strAlcoholic, strGlass: String?
    var strInstructions: String?
    var strDrinkThumb: String?
    var strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    var strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?
    var strImageSource: String?
    var strImageAttribution, strCreativeCommonsConfirmed, dateModified: String?
    
    enum CodingKeys: String, CodingKey {
        case idDrink, strDrink, strTags, strCategory, strIBA, strAlcoholic, strGlass, strInstructions,
             strDrinkThumb, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
             strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
             strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
             strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7,
             strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14,
             strMeasure15, strImageSource, strImageAttribution, strCreativeCommonsConfirmed, dateModified
    }
    
    func getIngredients() -> String {
        return "Ingredients"
    }

    func getMeasures() -> String {
        return "Measures"
    }
}
