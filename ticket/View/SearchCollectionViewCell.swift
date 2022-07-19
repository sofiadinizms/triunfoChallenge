//
//  SearchCollectionViewCell.swift
//  ticket
//
//  Created by sofiadinizms on 18/07/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "searchCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(image: UIImage, title: String, date: String){
        
        imageView.image = image
        titleLabel.text = title
        dateLabel.text = date
        
    }
}
