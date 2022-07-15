//
//  SeeAllViewController.swift
//  ticket
//
//  Created by sofiadinizms on 15/07/22.
//

import UIKit

class SeeAllViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

   
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    @IBOutlet var seeAllCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        seeAllCollectionView.dataSource = self
        seeAllCollectionView.delegate = self
        
        self.title = "See All"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
