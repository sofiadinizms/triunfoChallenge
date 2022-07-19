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

}
