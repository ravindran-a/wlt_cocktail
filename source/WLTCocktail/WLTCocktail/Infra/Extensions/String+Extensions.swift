//
//  String+Extensions.swift
//  WLTCocktail
//
//  Created by Ravindran on 22/04/22.
//

import Foundation
extension String {
    var urlEncoded: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
