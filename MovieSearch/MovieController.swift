//
//  MovieController.swift
//  MovieSearch
//
//  Created by Chance Robertson on 2/16/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import Foundation

class MovieController {
    
    static func fetchMovies(withSearchTerm searchTerm: String, completion: @escaping ([Movie?]) -> Void) {
        guard let url = Keys.baseURL else { return }
        let urlParameters = [Keys.apiKey: Keys.apiValueKey, Keys.searchTermKey: searchTerm]
        NetworkController.performRequest(forURL: url, httpMethod: .get, urlParameters: urlParameters) { (data, error) in
            if let error = error {
                print("Error performing request. \(error.localizedDescription)")
            }
            guard let data = data,
                let responseDictionary = (try? JSONSerialization.jsonObject(with: data)) as? [String:AnyObject],
                let resultsArray = responseDictionary[Keys.resultsKey] as? [[String:AnyObject]] else {
                    print("Error serializing JSON data.")
                    return
            }
            let movies = resultsArray.flatMap { Movie(dictionary: $0) }
            completion(movies)
        }
    }
}
