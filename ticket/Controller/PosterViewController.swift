//
//  PosterViewController.swift
//  ticket
//
//  Created by sofiadinizms on 19/07/22.
//

import UIKit

class PosterViewController: UIViewController {
    @IBOutlet var posterImage: UIImageView!
    
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        posterImage.image = image
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
