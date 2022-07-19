//
//  SearchViewController.swift
//  ticket
//
//  Created by sofiadinizms on 18/07/22.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UISearchResultsUpdating {
    
    var searchResults: [Movie] = []
    
    let searchController = UISearchController()
    
    @IBOutlet var searchCollectionView: UICollectionView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "busca"

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let title = searchController.searchBar.text else{
            return
        }
        
        Task{
            searchResults = await Movie.searchAPI(title: title)
            searchCollectionView.reloadData()
            print(title)
        }
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
