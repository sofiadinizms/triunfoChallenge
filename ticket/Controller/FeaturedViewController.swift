//
//  ViewController.swift
//  ticket
//
//  Created by sofiadinizms on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies = Movie.nowPlayingMovies()
    var upcomingMovies = Movie.upcomingMovies()
    
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    @IBOutlet var popularSeeAll: UIButton!
    @IBOutlet var nowPlayingSeeAll: UIButton!
    @IBOutlet var upcomingSeeAll: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        
        Task{
            popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            
            nowPlayingMovies = await Movie.nowPlayingAPI()
            self.nowPlayingCollectionView.reloadData()
            
            upcomingMovies = await Movie.upcomingAPI()
            self.upcomingCollectionView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        } else if let destination = segue.destination as? SeeAllViewController,
                    let button = sender as? UIButton{
            if button == popularSeeAll{
                destination.movies = popularMovies
            } else if button == nowPlayingSeeAll{
                destination.movies = nowPlayingMovies
            } else{
                destination.movies = upcomingMovies
            }
        }
    }
        
}
    
