//
//  GetFilmTableViewController.swift
//  Get People
//
//  Created by admin on 23/12/2021.
//

import UIKit
import Alamofire

class GetFilmTableViewController: UITableViewController {
    
    var filmArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://swapi.dev/api/films/?format=json").responseDecodable(of: FilmRespons.self) { response in
            let x = response.value
            if let x = x {
                for film in x.results {
                    self.filmArray.append(film.title)
                }
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        cell.textLabel?.text = filmArray[indexPath.row]
        return cell
    }

}
