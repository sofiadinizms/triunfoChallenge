//
//  SearchViewController+UICollectionViewDelegate.swift
//  ticket
//
//  Created by sofiadinizms on 18/07/22.
//

import UIKit

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie:Movie = searchResults[indexPath.item]
        
        self.performSegue(withIdentifier: "searchDetailsSegue", sender: movie)
        
        
    }
}
