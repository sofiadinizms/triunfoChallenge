//
//  TrendingViewController+UICollectionViewDataSource.swift
//  ticket
//
//  Created by sofiadinizms on 19/07/22.
//

import UIKit

extension TrendingViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return makeTrendingCell(indexPath)
    }
    
    fileprivate func makeTrendingCell(_ indexPath: IndexPath) -> TrendingCollectionViewCell{
        
        let cell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.cellIdentifier, for: indexPath) as? TrendingCollectionViewCell
        
        let trendingMovie = trendingMovies[indexPath.item]
        
        cell?.setup(image: UIImage(), title: trendingMovie.title, date: trendingMovie.releaseDate)
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: trendingMovie.posterPath)
            let image:UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(image: image, title: trendingMovie.title, date: trendingMovie.releaseDate)
        }
        
        return cell ?? TrendingCollectionViewCell()
    }
    
}
