//
//  PeopleAPI.swift
//  Get People
//
//  Created by admin on 25/12/2021.
//

import Foundation
import Alamofire

struct PeopleAPI {
    
    static let url = "https://swapi.dev/api/people/?format=json"

    
    static func getPeopleAPIResult(completion: @escaping ([People]?,Error?) -> ()){
        AF.request(url).responseDecodable(of: PeopleRespons.self) {response in
            
            if let error = response.error {
                completion(nil,error)
                return
            }
    
            if let people  = response.value?.results {
                completion(people, nil)
                return
            }
        }
    }

}

