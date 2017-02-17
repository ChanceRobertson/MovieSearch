//
//  Keys.swift
//  MovieSearch
//
//  Created by Chance Robertson on 2/16/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import Foundation

struct Keys {
    static let titleKey = "title"
    static let ratingKey = "vote_average"
    static let descriptionKey = "overview"
    static let posterURLPathExtensionKey = "poster_path"
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    static let baseURLforImage = URL(string: "http://image.tmdb.org/t/p/w500")
    static let apiKey = "api_key"
    static let apiValueKey = "79e77df6ddd71c9cc245f34dfb6220e8"
    static let searchTermKey = "query"
    static let resultsKey = "results"
}
