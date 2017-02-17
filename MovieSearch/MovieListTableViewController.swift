//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Chance Robertson on 2/16/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let spinner = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    var movies: [Movie?] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.spinner.stopAnimating()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return MovieTableViewCell() }
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        spinner.frame = self.view.frame
        spinner.hidesWhenStopped = true
        self.view.addSubview(spinner)
        spinner.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.searchBar.resignFirstResponder()
        
        guard let searchTerm = searchBar.text?.lowercased(), !searchTerm.isEmpty else { return }
        MovieController.fetchMovies(withSearchTerm: searchTerm) { (movies) in
            self.movies = movies
        }
    }
}
