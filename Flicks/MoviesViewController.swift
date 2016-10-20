//
//  MoviesViewController.swift
//  Flicks
//
//  Created by Keith Smyth on 10/16/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit
import SVProgressHUD

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var moviesTableView: UITableView!
    
    let movieProvider = MovieProvider()
    var movies = [MovieModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        showLoading(isLoading: true)
        movieProvider.fetchNowPlaying(successCallback: { (movies) -> Void in
                self.showLoading(isLoading: false)
                self.movies = movies
                self.moviesTableView.reloadData()
            },errorCallbackOrNil: { (error) -> Void in
                self.showLoading(isLoading: false)
            })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movieDetailViewController = segue.destination as! MovieDetailViewController
        let movieTableViewCell = sender as! MovieTableViewCell
        movieDetailViewController.movie = movieTableViewCell.movie
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "com.keithsmyth.MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movie = movie
        cell.titleLabel.text = movie.title
        cell.descriptionLabel.text = movie.description
        if let thumbnailUrl = movie.thumbnailUrl {
            cell.movieImageView.setImageWith(URL(string: thumbnailUrl)!)
        } else {
            cell.movieImageView.image = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func showLoading(isLoading: Bool) {
        if isLoading {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
        moviesTableView.alpha = isLoading ? 0 : 1
    }
}

