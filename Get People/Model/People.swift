//
//  People.swift
//  Get People
//
//  Created by admin on 23/12/2021.
//

import Foundation

struct PeopleRespons: Decodable {
    var results: [People]
}

struct People: Decodable {
    var name: String
    var birth_year: String
    var gender: String
    var mass:String
}
