//
//  MovieModel.swift
//  Flicks
//
//  Created by Keith Smyth on 10/16/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation

class MovieModel {
    
    var title: String
    var description: String
    var posterSuffix: String
    
    init(title: String, description: String, posterSuffix: String) {
        self.title = title
        self.description = description
        self.posterSuffix = posterSuffix
    }
}
