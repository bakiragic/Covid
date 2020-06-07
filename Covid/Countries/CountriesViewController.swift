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
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var TopBarView: TopBarView!
    @IBOutlet var sendDataButton: UIButton!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
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
        tableView.dataSource = self
        tableView.delegate = self
    }
  
    
    
    
    
    
}
    
extension CountriesViewController: UITableViewDataSource{
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return appDelegate.countries.count
    }
    
    func tableView( _ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let country = appDelegate.countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableCell") as! CountriesTableCell
        cell.setCountryName(country: country)
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected at row \(indexPath.row)")
        appDelegate.countries[indexPath.row].selected = true
        appDelegate.indexes.append(indexPath.row)
        navigationController?.popViewController(animated: true)        
    }
}
