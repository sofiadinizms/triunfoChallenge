//
//  TrendingViewController.swift
//  ticket
//
//  Created by sofiadinizms on 18/07/22.
//

import UIKit

class TrendingViewController: UIViewController{
    
    @IBOutlet var trendingCollectionView: UICollectionView!
    
    var trendingMovies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        
        Task{
            trendingMovies = await Movie.popularMoviesAPI()
            self.trendingCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }

}
