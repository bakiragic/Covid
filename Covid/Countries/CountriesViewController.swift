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
    var countriesNames: [String]!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TopBarView.setTopBar(image: "close", text: "CHOOSE COUNTRY")
        countriesNames = DatabaseHelper.dbHelper.readDistinctNames()
        countriesNames = countriesNames.sorted{ $0 < $1}
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func backButtonToFirst(sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
}
    
extension CountriesViewController: UITableViewDataSource{
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return countriesNames.count
    }
    
    func tableView( _ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let country = countriesNames[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableCell") as! CountriesTableCell
        cell.setCountryName(country: country)
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DatabaseHelper.dbHelper.update(name: countriesNames[indexPath.row], value: true)
        appDelegate.insert(element: countriesNames[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
}
