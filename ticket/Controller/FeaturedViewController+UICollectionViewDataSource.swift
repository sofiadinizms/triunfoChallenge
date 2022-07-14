//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  ticket
//
//  Created by sofiadinizms on 12/07/22.
//

import UIKit

extension FeaturedViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView{
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionView{
            return nowPlayingMovies.count
        } else if collectionView == self.upcomingCollectionView{
            return upcomingMovies.count
        } else {
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.popularCollectionView{
            return makePopularCell(indexPath)
            
        } else if collectionView == self.nowPlayingCollectionView {
            
            return makeNowPlayingCell(indexPath)
        } else if collectionView == self.upcomingCollectionView {
            
            return makeUpcomingCell(indexPath)
        } else {
            return UICollectionViewCell()
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        cell?.setup(title: popularMovies[indexPath.item].title, image: UIImage(named: popularMovies[indexPath.item].backdrop) ?? UIImage())
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        
        cell?.setup(image: UIImage(named: nowPlayingMovies[indexPath.item].poster) ?? UIImage(), date: year, title: nowPlayingMovies[indexPath.item].title)
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        cell?.setup(image: UIImage(named: upcomingMovies[indexPath.item].poster) ?? UIImage(), title: upcomingMovies[indexPath.item].title, date: upcomingMovies[indexPath.item].releaseDate)
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
}
