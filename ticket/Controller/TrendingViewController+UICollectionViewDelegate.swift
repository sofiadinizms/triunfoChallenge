//
//  TrendingViewController+UICollectionViewDelegate.swift
//  ticket
//
//  Created by sofiadinizms on 19/07/22.
//

import UIKit

extension TrendingViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie:Movie = trendingMovies[indexPath.item]
        
        self.performSegue(withIdentifier: "trendingDetailsSegue", sender: movie)
        
    }
}
