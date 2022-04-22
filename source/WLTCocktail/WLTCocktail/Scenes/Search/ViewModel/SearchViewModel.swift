//
//  SearchViewModel.swift
//  WLTCocktail
//
//  Created by Ravindran on 22/04/22.
//

import Foundation

class SearchViewModel {
    
    var searchResponse: SearchModel?
    var searchList: [DrinkModel]?
    
    func getSearchInfo(searchKey: String, completionHandler: ((Error?) -> Void)? = nil) {
        let endPoint = APIEndPoints.CockTailInfo.search(key: searchKey).url
        ApiManager.shared.dataTask(serviceURL: endPoint) {[weak self] data, error in
            guard let responseData = data, error == nil else {
                completionHandler?(error)
                return
            }
            do {
                let responseModel = try JSONDecoder().decode(SearchModel.self, from: responseData)
                self?.searchResponse = responseModel
                self?.searchList = responseModel.drinks
                completionHandler?(nil)
            } catch let error {
                completionHandler?(error)
            }
        }
    }
    
}
