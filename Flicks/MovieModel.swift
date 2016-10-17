//
//  MovieModel.swift
//  Flicks
//
//  Created by Keith Smyth on 10/16/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation

class MovieModel {
    
    var title: String?
    var description: String?
    var posterSuffix: String?
    
    init(jsonItem: NSDictionary) {
        title = jsonItem.value(forKey: "title") as? String
        description = jsonItem.value(forKey: "overview") as? String
        posterSuffix = jsonItem.value(forKey: "poster_path") as? String
    }
}
