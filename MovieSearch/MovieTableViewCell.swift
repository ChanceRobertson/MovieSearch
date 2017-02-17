//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Chance Robertson on 2/16/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell() {
        guard let movie = movie else { return }
        self.titleLabel.text = movie.title
        self.ratingLabel.text = "Rating: \(movie.rating)"
        self.descriptionLabel.text = movie.description
        
        guard let posterURL = movie.poseterURL else { return }
        ImageController.getImage(forURL: posterURL) { (poster) in
            self.posterImageView.image = poster
        }
    }
}
