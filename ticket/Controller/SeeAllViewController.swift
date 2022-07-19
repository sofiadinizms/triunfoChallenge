//
//  SeeAllViewController.swift
//  ticket
//
//  Created by sofiadinizms on 15/07/22.
//

import UIKit

class SeeAllViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

   
    var movies: [Movie]?
    
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

}
