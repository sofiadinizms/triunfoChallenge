//
//  SeeAllViewController+UICollectionViewDelegate.swift
//  ticket
//
//  Created by sofiadinizms on 19/07/22.
//

import UIKit

extension SeeAllViewController{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie:Movie = (movies?[indexPath.item])!
        
        self.performSegue(withIdentifier: "seeAllDetailsSegue", sender: movie)
        
    }
}
