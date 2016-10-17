//
//  MovieProvider.swift
//  Flicks
//
//  Created by Keith Smyth on 10/16/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation
import AFNetworking

class MovieProvider {
    
    private let params = ["api_key": "a07e22bc18f5cb106bfe4cc1f83ad8ed"]
    private let nowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing"
    
    func fetchNowPlaying(successCallback: @escaping ([MovieModel]) -> Void, errorCallbackOrNil: ((Error?) -> Void)?) {
        let manager = AFHTTPSessionManager()
        manager.get(nowPlayingUrl, parameters: params, progress: nil,
                    success: { (task, responseObject) -> Void in
                        if let responseDict = responseObject as? NSDictionary {
                            if let results = responseDict["results"] as? NSArray {
                                var movies = [MovieModel]()
                                for resultItem in results as! [NSDictionary] {
                                    movies.append(MovieModel(jsonItem: resultItem))
                                }
                                successCallback(movies)
                            }
                        }
                    },
                    failure: { (task, requestError) -> Void in
                        if let errorCallback = errorCallbackOrNil {
                            errorCallback(requestError)
                        }
                    })?.resume()
    }
}
