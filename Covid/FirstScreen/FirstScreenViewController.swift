//
//  FirstScreenViewController.swift
//  Covid
//
//  Created by Bakir Agic on 5/24/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import UIKit
import CoreData

class FirstScreenViewController: UIViewController {
    
    @IBOutlet var TopBar: TopBarView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var detailsTable: UITableView!
    @IBOutlet var noCountriesView: UIView!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TopBar.setTopBar(image: "add", text: "NEW COVID INFORMATION")
        detailsTable.dataSource = self
        detailsTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        appDelegate.firstScreenCountries = appDelegate.firstScreenCountries.sorted{ $0.name < $1.name}
        hideShowViews()
        detailsTable.reloadData()
    }
    
   
    func hideShowViews(){
        if appDelegate.firstScreenCountries.count != 0{
                   noCountriesView.isHidden = true
                   detailsTable.isHidden = false
               }
               else{
                   noCountriesView.isHidden = false
                   detailsTable.isHidden = true
               }
    }
       
    @IBAction func addCountry(sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let countriesVC = storyboard.instantiateViewController(identifier: "CountriesViewController") as! CountriesViewController
        show(countriesVC, sender: self)
    }
}


extension FirstScreenViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = appDelegate.firstScreenCountries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstScreenTableViewCell") as! FirstScreenTableCellTableViewCell
        cell.setCountry(country: CountryBase.Country(id: country.id, name: country.name, confirmed: country.confirmed, recovered: country.recovered, deaths: country.deaths, date: country.date))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.firstScreenCountries.count
    }
}

extension FirstScreenViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            DatabaseHelper.dbHelper.update(name: appDelegate.firstScreenCountries[indexPath.row].name, value: false)
            appDelegate.firstScreenCountries.remove(at: indexPath.row)
            detailsTable.deleteRows(at: [indexPath], with: .left)
            hideShowViews()
           }
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        appDelegate.detailsListCountry = appDelegate.firstScreenCountries[indexPath.row].name
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        show(detailsVC, sender: self)
    }
}
