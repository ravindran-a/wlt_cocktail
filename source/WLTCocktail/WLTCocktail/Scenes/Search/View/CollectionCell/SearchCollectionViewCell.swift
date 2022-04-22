//
//  SearchCollectionViewCell.swift
//  WLTCocktail
//
//  Created by Ravindran on 22/04/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "SearchCollectionViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
    }

}
