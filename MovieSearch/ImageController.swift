//
//  ImageController.swift
//  MovieSearch
//
//  Created by Chance Robertson on 2/16/17.
//  Copyright © 2017 Chance Robertson. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func getImage(forURL url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else { fatalError("Image URL optional is nil.") }
        NetworkController.performRequest(forURL: url, httpMethod: .get) { (data, error) in
            if let error = error {
                fatalError("Error performing network request: \(error.localizedDescription)")
            }
            guard let data = data,
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async { completion(nil) }
                    return
            }
            DispatchQueue.main.async { completion(image) }
        }
    }
}
