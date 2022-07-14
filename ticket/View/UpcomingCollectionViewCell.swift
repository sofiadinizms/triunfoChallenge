//
//  UpcomingCollectionViewCell.swift
//  ticket
//
//  Created by sofiadinizms on 13/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setup(image: UIImage, title: String, date: String){
        
        imageView.image = image
        titleLabel.text = title
        dateLabel.text = date
    }
    
}
