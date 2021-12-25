//
//  GetFilmTableViewController.swift
//  Get People
//
//  Created by admin on 23/12/2021.
//

import UIKit
import Alamofire

class GetFilmTableViewController: UITableViewController {
    
    var filmArray: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attemptToFetchFilmAPI()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        cell.textLabel?.text = filmArray[indexPath.row].title
        return cell
    }
    
    func attemptToFetchFilmAPI(){
        FilmAPI.getFilmAPIResult { [weak self] (film, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let film = film else {
                return
            }
            self?.filmArray = film
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
