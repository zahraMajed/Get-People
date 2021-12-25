//
//  FilmAPI.swift
//  Get People
//
//  Created by admin on 25/12/2021.
//

import Foundation
import Alamofire

class FilmAPI {
    static let url = "https://swapi.dev/api/films/?format=json"
    
    static func getFilmAPIResult(completion: @escaping ([Film]?,Error?) -> ()){
        AF.request(url).responseDecodable(of: FilmRespons.self) {response in
            
            if let error = response.error {
                completion(nil,error)
                return
            }
    
            if let film  = response.value?.results {
                completion(film, nil)
                return
            }
        }
    }
    
}
