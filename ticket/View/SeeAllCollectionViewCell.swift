//
//  SeeAllCollectionViewCell.swift
//  ticket
//
//  Created by sofiadinizms on 15/07/22.
//

import UIKit

class SeeAllCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "seeAllCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    func setup(image:UIImage, title: String, date:String, rating:Float){
        
        imageView.image = image
        titleLabel.text = title
        dateLabel.text = date
        ratingLabel.text = "\(rating)"
        
    }
    
    
    
}
