//
//  SearchViewController.swift
//  WLTCocktail
//
//  Created by Ravindran on 21/04/22.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var searchGrid: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var noResults: UILabel!
    var searchString: String?
    var searchVM: SearchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        searchBar.showsCancelButton = true
        searchBar.returnKeyType = .search
        spinner.stopAnimating()
        noResults.text = "No results found."
        noResults.isHidden = true
        self.title = "Let's eat Quality food"
        searchGrid.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SearchCollectionViewCell.cellIdentifier)
    }

}

extension SearchViewController {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchString = nil
        searchBar.resignFirstResponder()
        self.searchVM.searchResponse = nil
        self.searchVM.searchList = nil
        noResults.isHidden = true
        searchGrid.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        noResults.isHidden = true
        searchBar.resignFirstResponder()
        searchString = searchBar.text
        if searchString == nil || searchString?.isEmpty == true {

        } else {
            spinner.startAnimating()
            searchVM.getSearchInfo(searchKey: self.searchString ?? "") {[weak self] error in
                self?.spinner.stopAnimating()
                if error != nil {
                    
                } else {
                    self?.searchGrid.reloadData()
                    if self?.searchVM.searchList == nil || self?.searchVM.searchList?.isEmpty == true {
                        self?.noResults.isHidden = false
                    }
                }
            }
        }
    }
    
}

extension SearchViewController {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchVM.searchList?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.cellIdentifier, for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        let drink = self.searchVM.searchList?[indexPath.item] ?? DrinkModel()
        cell.imageView.imageWithURL(drink.strDrinkThumb ?? "")
        cell.nameLabel.text = drink.strDrink ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let uiStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        let detailVC = uiStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        detailVC?.drink = self.searchVM.searchList?[indexPath.item] ?? DrinkModel()
        self.navigationController?.pushViewController(detailVC ?? UIViewController(), animated: true)
    }
    
}

extension SearchViewController {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }

}
