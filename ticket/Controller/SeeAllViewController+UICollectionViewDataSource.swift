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
        
        let movie = movies[indexPath.item]
        
        cell?.setup(image: UIImage(), title: movie.title, date: movie.releaseDate ?? "", rating: movie.voteAverage)
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: (movie.posterPath ?? ""))
            let imagem: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(image: imagem, title: movie.title, date: String(movie.releaseDate?.prefix(4) ?? ""), rating: movie.voteAverage)
        }
        
        return cell ?? SeeAllCollectionViewCell()
    }
}
