//
//  NowPlayingCollectionViewCell.swift
//  ticket
//
//  Created by sofiadinizms on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup( image:UIImage, date: String, title:String ){
        
        dateLabel.text = date
        titleLabel.text = title
        imageView.image = image
    }
}
