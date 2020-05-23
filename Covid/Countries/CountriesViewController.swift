//
//  CountriesViewController.swift
//  Covid
//
//  Created by Bakir Agic on 5/23/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation

import UIKit

class CountriesViewController: UIViewController{
    
    var countries: [Country] = []
    @IBOutlet var tableView: UITableView!
    @IBOutlet var TopBarView: TopBarView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries = createListOfCountries()
        tableView.dataSource = self
    }
    
  
    
    func createListOfCountries() -> [Country] {
        var pomCountries: [Country] = []
        
        pomCountries.append(Country(name: "Bosnia and Herzegovina"))
        pomCountries.append(Country(name: "Croatia"))
        pomCountries.append(Country(name: "Serbia"))
        pomCountries.append(Country(name: "Montenegro"))
        pomCountries.append(Country(name: "North Macedonia"))
        
        return pomCountries

    }
}
    
    extension CountriesViewController: UITableViewDataSource{
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return countries.count
        
    }
    
    func tableView( _ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let country = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableCell") as! CountriesTableCell
        cell.setCountryName(country: country)
        return cell
        
    }
}
