//
//  MoviesViewController.swift
//  MultiplesMVC
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//
import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 200
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        self.movies = MovieData.movies
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movies[indexPath.row]
        let leftAlligned = indexPath.row % 2 == 0
        if leftAlligned {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath) as? MoviesViewCell
            cell?.movieView.image = UIImage(named: movie.posterImageName)
            cell?.movieTitle.text = movie.name
            cell?.movieYear.text = String(movie.year)
            cell?.movieGenre.text = movie.genre
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell Right", for: indexPath) as? MoviesViewCell
            cell?.movieView.image = UIImage(named: movie.posterImageName)
            cell?.movieTitle.text = movie.name
            cell?.movieYear.text = String(movie.year)
            cell?.movieGenre.text = movie.genre
            return cell!
        }
//        return UITableViewCell();ceil
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let destination = segue.destination as? MovieDetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedMovie = self.movies[selectedRow]
            destination.movie = selectedMovie
        }
        // Pass the selected object to the new view controller.
    }
 
    
}
