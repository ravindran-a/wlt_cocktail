//
//  APIEndpoints.swift
//  WLTCocktail
//
//  Created by Ravindran on 22/04/22.
//

import Foundation

struct APIEndPoints {
    
    static let API_BASE_URL: String = "https://thecocktaildb.com/api/json/v1/1"

    enum CockTailInfo {
        case search(key: String)
        
        var url: String {
            switch self {
            case .search(let key):
                return "/search.php?s=\(key)"
            }
        }
    }
    
}
