//
//  CountriesViewController.swift
//  Covid
//
//  Created by Bakir Agic on 5/23/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CountriesViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var TopBarView: TopBarView!
    @IBOutlet var sendDataButton: UIButton!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TopBarView.setTopBar(image: "close", text: "CHOOSE COUNTRY")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}
    
extension CountriesViewController: UITableViewDataSource{
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return DatabaseHelper.dbHelper.readDistinctNamesCount()
    }
    
    func tableView( _ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let country:CountryBase = DatabaseHelper.dbHelper.read(id: indexPath.row)
        print(country.name)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableCell") as! CountriesTableCell
        cell.setCountryName(country: country)
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DatabaseHelper.dbHelper.update(id: indexPath.row, value: true)
        navigationController?.popViewController(animated: true)
    }
}
