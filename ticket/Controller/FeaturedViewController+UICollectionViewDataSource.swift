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
        
        let movie = popularMovies[indexPath.item]

        cell?.setup(title: movie.title, image: UIImage())

        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem)
        }
        
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let nowPlayingMovie = nowPlayingMovies[indexPath.item]
        
        let year: String = "\(nowPlayingMovie.releaseDate.prefix(4))"
        
        cell?.setup(image: UIImage(), date: year, title: nowPlayingMovie.title)
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: nowPlayingMovie.posterPath)
            let image:UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(image: image, date: nowPlayingMovie.releaseDate, title: nowPlayingMovie.title)
        }
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let upcomingMovie = upcomingMovies[indexPath.item]
        
        cell?.setup(image: UIImage(), title: upcomingMovie.title, date: upcomingMovie.releaseDate)
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: upcomingMovie.posterPath)
            let image:UIImage = UIImage(data: imageData) ?? UIImage()
            
            cell?.setup(image: image, title: upcomingMovie.title, date: upcomingMovie.releaseDate)
        }
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
}
