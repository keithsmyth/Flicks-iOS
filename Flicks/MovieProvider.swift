//
//  MovieProvider.swift
//  Flicks
//
//  Created by Keith Smyth on 10/16/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation

class MovieProvider {
    
    func getNowPlaying() -> [MovieModel] {
        return [MovieModel(title: "The Magnificent Seven", description: "A big screen remake of John Sturges' classic western The Magnificent Seven, itself a remake of Akira Kurosawa's Seven Samurai. Seven gun men in the old west gradually come together to help a poor village against savage thieves.", posterSuffix: "/z6BP8yLwck8mN9dtdYKkZ4XGa3D.jpg"),
                MovieModel(title: "Miss Peregrine's Home for Peculiar Children", description: "A teenager finds himself transported to an island where he must help protect a group of orphans with special powers from creatures intent on destroying them.", posterSuffix: "/uSHjeRVuObwdpbECaXJnvyDoeJK.jpg"),
                MovieModel(title: "Inferno", description: "After waking up in a hospital with amnesia, professor Robert Langdon and a doctor must race against time to foil a deadly global plot.", posterSuffix: "/oFOG2yIRcluKfTtYbzz71Vj9bgz.jpg")]
    }
}
