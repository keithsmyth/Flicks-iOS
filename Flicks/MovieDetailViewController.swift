//
//  MovieDetailViewController.swift
//  Flicks
//
//  Created by Keith Smyth on 10/16/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let posterUrl = movie?.posterUrl {
            movieImageView.setImageWith(URL(string: posterUrl)!)
        }
        titleLabel.text = movie?.title
        descriptionLabel.text = movie?.description
        releaseDateLabel.text = movie?.releaseDateFormatted
    }
}
