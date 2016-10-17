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
    private let posterWidthUrl = "w500"
    
    let title: String?
    let description: String?
    let thumbnailUrl: String?
    let posterUrl: String?
    let releaseDateFormatted: String?
    
    init(jsonItem: NSDictionary) {
        title = jsonItem.value(forKey: "title") as? String
        description = jsonItem.value(forKey: "overview") as? String
        let posterSuffixOrNil = jsonItem.value(forKey: "poster_path") as? String
        thumbnailUrl = posterSuffixOrNil != nil ? (baseUrl + thumbnailWidthUrl + posterSuffixOrNil!) : nil
        posterUrl = posterSuffixOrNil != nil ? (baseUrl + posterWidthUrl + posterSuffixOrNil!) : nil
        let releaseDateString = jsonItem.value(forKey: "release_date") as? String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let releaseDate = dateFormatter.date(from: releaseDateString!)
        dateFormatter.dateStyle = DateFormatter.Style.long
        releaseDateFormatted = releaseDate != nil ? dateFormatter.string(from: releaseDate!) : nil
    }
}
