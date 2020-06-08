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
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
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
      //  return appDelegate.countries.count
        return appDelegate.getDBsize()
    }
    
    func tableView( _ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let country:CountryBase = DatabaseHelper.dbHelper.read(id: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableCell") as! CountriesTableCell
        cell.setCountryName(country: country)
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected at row \(indexPath.row)")
        DatabaseHelper.dbHelper.update(id: indexPath.row, value: true)
        navigationController?.popViewController(animated: true)
    }
}
