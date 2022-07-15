//
//  SeeAllViewController+UICollectionViewDataSource.swift
//  ticket
//
//  Created by sofiadinizms on 15/07/22.
//

import UIKit

extension SeeAllViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return makeSeeAllCell(indexPath)
    }
    
    fileprivate func makeSeeAllCell(_ indexPath: IndexPath) -> SeeAllCollectionViewCell{
        let cell = seeAllCollectionView.dequeueReusableCell(withReuseIdentifier: SeeAllCollectionViewCell.cellIdentifier, for: indexPath) as? SeeAllCollectionViewCell
        
        cell?.setup(image: UIImage(named: popularMovies[indexPath.item].posterPath) ?? UIImage(), title: popularMovies[indexPath.item].title, date: popularMovies[indexPath.item].releaseDate, rating: popularMovies[indexPath.item].voteAverage)
        
        return cell ?? SeeAllCollectionViewCell()
    }
}
