//
//  DetailsViewController.swift
//  Get People
//
//  Created by admin on 25/12/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNameOrTitle: UILabel!
    @IBOutlet weak var lblBirthYearOrDirector: UILabel!
    @IBOutlet weak var lblGenderOrDate: UILabel!
    @IBOutlet weak var lblMassOrOpeningC: UILabel!
    
    var peopleArrayD: [People] = []
    var filmArray :[Film] = []
    var type = ""
    var indexArr = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        if type == "People" {
            lblTitle.text = " People Details"
            indexArr = peopleArrayD.endIndex-1
            lblNameOrTitle.text = "Name: \(peopleArrayD[indexArr].name)"
            lblGenderOrDate.text = "Gender: \(peopleArrayD[indexArr].gender)"
            lblMassOrOpeningC.text = "Mass: \(peopleArrayD[indexArr].mass)"
            lblBirthYearOrDirector.text = "Birth Year: \(peopleArrayD[indexArr].birth_year)"
        }else if type == "Film" {
            lblTitle.text = " Film Details"
            indexArr = filmArray.endIndex-1
            lblNameOrTitle.text = "Title: \(filmArray[indexArr].title)"
            lblGenderOrDate.text = "Release Date:: \(filmArray[indexArr].release_date)"
            lblMassOrOpeningC.text = "Opining Crawl: \(filmArray[indexArr].opening_crawl)"
            lblBirthYearOrDirector.text = "Director: \(filmArray[indexArr].director)"
        }
    }

}
