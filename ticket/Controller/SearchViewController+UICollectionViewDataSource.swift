//
//  SearchViewController+UICollectionViewDataSource.swift
//  ticket
//
//  Created by sofiadinizms on 18/07/22.
//

import UIKit

extension SearchViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return makeSearchCell(indexPath)
    }
    
    fileprivate func makeSearchCell(_ indexPath: IndexPath) -> SearchCollectionViewCell{
        
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.cellIdentifier, for: indexPath) as? SearchCollectionViewCell
        
        let searchResultItem = searchResults[indexPath.item]
        
        cell?.setup(image: UIImage(), title: searchResultItem.title, date: searchResultItem.releaseDate)
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: searchResultItem.posterPath)
            
            let image:UIImage = UIImage(data: imageData) ?? UIImage()
            
            cell?.setup(image: image, title: searchResultItem.title, date: searchResultItem.releaseDate)
        }
        
        return cell ?? SearchCollectionViewCell()
    }
}
