//
//  GetPeopleTableViewController.swift
//  Get People
//
//  Created by admin on 23/12/2021.
//

import UIKit
import Alamofire

class GetPeopleTableViewController: UITableViewController {
    
    var peopleArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://swapi.dev/api/people/?format=json").responseDecodable(of: PeopleRespons.self) { response in
            let x = response.value
            if let x = x {
                for person in x.results {
                    self.peopleArray.append(person.name)
                }
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.textLabel?.text = peopleArray[indexPath.row]
        return cell
    }

}
