//
//  MovieDetailViewController.swift
//  MultiplesMVC
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieActors: UILabel!
    @IBOutlet weak var movieDetail: UITextView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {
            return
        }
        movieImage.image = UIImage(named: movie.posterImageName)
        movieName.text = movie.name
        movieYear.text = String(movie.year)
        movieActors.text = movie.cast.joined(separator: " ")
        movieDetail.text = movie.description
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
