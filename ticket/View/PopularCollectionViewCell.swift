//
//  PopularCollectionViewCell.swift
//  ticket
//
//  Created by sofiadinizms on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "popularCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup( title:String, image:UIImage ){
        titleLabel.text = title
        imageView.image = image
    }
}
