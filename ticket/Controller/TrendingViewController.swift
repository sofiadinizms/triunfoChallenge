//
//  TrendingViewController.swift
//  ticket
//
//  Created by sofiadinizms on 18/07/22.
//

import UIKit

class TrendingViewController: UIViewController{
    
    @IBOutlet var trendingCollectionView: UICollectionView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var trendingMovies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        
        Task{
            trendingMovies = await Movie.trendingAPI(period: "day")
            self.trendingCollectionView.reloadData()
        }
    }
    
    @IBAction func segmentControllClick(_ sender: Any) {
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                Task{
                    trendingMovies = await Movie.trendingAPI(period: "day")
                    self.trendingCollectionView.reloadData()
                }
            case 1 :
                Task{
                    trendingMovies = await Movie.trendingAPI(period: "week")
                    self.trendingCollectionView.reloadData()
                }
            default:
                break
            }
            
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }

}
