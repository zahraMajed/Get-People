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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromPeople", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is IndexPath {
            let destination = segue.destination as! DetailsViewController
            let indexP = sender as! IndexPath
            print(indexP.row)
            print(peopleArray[indexP.row])
            destination.peopleArrayD.append(peopleArray[indexP.row])
            destination.type = "People"
        }
    }
}

