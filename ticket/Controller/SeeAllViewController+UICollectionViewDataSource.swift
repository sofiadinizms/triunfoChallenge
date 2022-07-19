//
//  SeeAllViewController+UICollectionViewDataSource.swift
//  ticket
//
//  Created by sofiadinizms on 15/07/22.
//

import UIKit

extension SeeAllViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let movies = movies else { return 0 }
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return makeSeeAllCell(indexPath)
    }
    
    fileprivate func makeSeeAllCell(_ indexPath: IndexPath) -> SeeAllCollectionViewCell{
        let cell = seeAllCollectionView.dequeueReusableCell(withReuseIdentifier: SeeAllCollectionViewCell.cellIdentifier, for: indexPath) as? SeeAllCollectionViewCell
        
        guard let movies = movies else { return SeeAllCollectionViewCell() }
        
        cell?.setup(image: UIImage(named: movies[indexPath.item].posterPath ?? "") ?? UIImage(), title: movies[indexPath.item].title, date: movies[indexPath.item].releaseDate ?? "", rating: movies[indexPath.item].voteAverage)
        
        return cell ?? SeeAllCollectionViewCell()
    }
}
