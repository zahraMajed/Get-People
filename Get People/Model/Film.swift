//
//  Film.swift
//  Get People
//
//  Created by admin on 23/12/2021.
//

import Foundation

struct FilmRespons: Decodable {
    var results: [Film]
}

struct Film: Decodable {
    var title: String
}
