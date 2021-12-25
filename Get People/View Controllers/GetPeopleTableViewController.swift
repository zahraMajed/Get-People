//
//  GetPeopleTableViewController.swift
//  Get People
//
//  Created by admin on 23/12/2021.
//

import UIKit
import Alamofire

class GetPeopleTableViewController: UITableViewController {
    
    var peopleArray: [People] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attemptToFetchPeopleAPI()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.textLabel?.text = peopleArray[indexPath.row].name
        return cell
    }
    
    func attemptToFetchPeopleAPI(){
        PeopleAPI.getPeopleAPIResult { [weak self] (people, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let people = people else {
                return
            }
            self?.peopleArray = people
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

