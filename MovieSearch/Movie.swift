//
//  Movie.swift
//  MovieSearch
//
//  Created by Chance Robertson on 2/16/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import Foundation

struct Movie {
    var title: String
    let rating: String
    let description: String
    let posterURLPath: String
    var poseterURL: URL? {
        return Keys.baseURLforImage?.appendingPathComponent(posterURLPath)
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[Keys.titleKey] as? String,
        let rating = dictionary[Keys.ratingKey] as? Double,
        let description = dictionary[Keys.descriptionKey] as? String,
        let posterURLPath = dictionary[Keys.posterURLPathExtensionKey] as? String else { return nil }
        
        self.title = title
        self.rating = String(rating)
        self.description = description
        self.posterURLPath = posterURLPath
    }
}
