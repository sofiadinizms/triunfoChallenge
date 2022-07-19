//
//  DetailsViewController.swift
//  ticket
//
//  Created by sofiadinizms on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    var movie:Movie?
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "posterSegue", sender: movie)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        self.backdropImage.image = UIImage(named:(movie.backdropPath ?? ""))
        self.titleLabel.text = movie.title
        self.posterImage.image = UIImage()
        self.ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        self.overviewLabel.text = movie.overview
        
        Task{
            let posterData = await Movie.downloadImageData(withPath: (movie.posterPath ?? ""))
            
            let poster:UIImage = UIImage(data: posterData) ?? UIImage()
            
            self.posterImage.image = poster
            
            let backdropData = await Movie.downloadImageData(withPath: (movie.backdropPath ?? ""))
            
            let backdrop:UIImage = UIImage(data: backdropData) ?? UIImage()
            
            self.backdropImage.image = backdrop
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PosterViewController{
            let poster = sender as? UIImage
            destination.posterImage.image = poster
        }
    }

}
