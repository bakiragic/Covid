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
    
    public var countries: [Country] = []
    @IBOutlet var tableView: UITableView!
    @IBOutlet var TopBarView: TopBarView!
    @IBOutlet var sendDataButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TopBarView.setTopBar(image: "close", text: "CHOOSE COUNTRY")
        countries = createListOfCountries()
        tableView.dataSource = self
        tableView.delegate = self
    }
  
    
    func createListOfCountries() -> [Country] {
        var pomCountries: [Country] = []
        
        pomCountries.append(Country(name: "Bosnia and Herzegovina", confirmed: "Confirmed: 2403", recovered: "Recovered: 1573", deaths: "Deaths: 139"))
        pomCountries.append(Country(name: "Croatia", confirmed: "Confirmed: 2243", recovered: "Recovered: 2023", deaths: "Deaths: 99"))
        pomCountries.append(Country(name: "Serbia", confirmed: "Confirmed: 11159", recovered: "Recovered: 5857", deaths: "Deaths: 238"))
        pomCountries.append(Country(name: "Montenegro", confirmed: "Confirmed: 324", recovered: "Recovered: 315", deaths: "Deaths: 9"))
        pomCountries.append(Country(name: "North Macedonia", confirmed: "Confirmed: 1978", recovered: "Recovered: 1422", deaths: "Deaths: 113"))
        
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

extension CountriesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected at row \(indexPath.row)")
        FirstScreenViewController.setCountry(country: countries[indexPath.row])
        navigationController?.popViewController(animated: true)        
    }
    
   // func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //UISwipeActionsConfiguration? {
          //  let action = deleteAction(at: indexPath)
       // }
       // return UISwipeActionsConfiguration(actions: delete)
  //  }
    
   
    
}
