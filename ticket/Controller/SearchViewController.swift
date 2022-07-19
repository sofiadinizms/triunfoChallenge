//
//  SearchViewController.swift
//  ticket
//
//  Created by sofiadinizms on 18/07/22.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource {
    
    var searchResults: [Movie] = []
    
    @IBOutlet var searchCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        
        Task{
            searchResults = await Movie.popularMoviesAPI()
            self.searchCollectionView.reloadData()
        }
        
        

        // Do any additional setup after loading the view.
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
