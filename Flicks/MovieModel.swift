//
//  MovieModel.swift
//  Flicks
//
//  Created by Keith Smyth on 10/16/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation

class MovieModel {
    
    private let baseUrl = "https://image.tmdb.org/t/p/"
    private let thumbnailWidthUrl = "w92"
    
    let title: String?
    let description: String?
    let thumbnailUrl: String?
    
    private let posterSuffixOrNil: String?
    
    init(jsonItem: NSDictionary) {
        title = jsonItem.value(forKey: "title") as? String
        description = jsonItem.value(forKey: "overview") as? String
        posterSuffixOrNil = jsonItem.value(forKey: "poster_path") as? String
        thumbnailUrl = posterSuffixOrNil != nil ? (baseUrl + thumbnailWidthUrl + posterSuffixOrNil!) : nil
    }
}
