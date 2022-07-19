//
//  PosterViewController.swift
//  ticket
//
//  Created by sofiadinizms on 19/07/22.
//

import UIKit

class PosterViewController: UIViewController {
    @IBOutlet var posterImage: UIImageView!
    
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task{
            let posterData = await Movie.downloadImageData(withPath: (movie?.posterPath ?? ""))
            
            let poster:UIImage = UIImage(data: posterData) ?? UIImage()
            
            self.posterImage.image = poster
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
