//
//  FirstScreenViewController.swift
//  Covid
//
//  Created by Bakir Agic on 5/24/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    static var countries: [Country] = []
    @IBOutlet var TopBar: TopBarView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var detailsTable: UITableView!
    @IBOutlet var noCountriesView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TopBar.setTopBar(image: "add", text: "NEW COVID INFORMATION")
        detailsTable.dataSource = self        
    }

    static func setCountry(country: Country){
        var pom: Bool = false
        for element in countries {
            if element.equal(country: country){
                pom = true
           }
        }
        if pom == false{
            countries.append(country)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        detailsTable.reloadData()
        if FirstScreenViewController.countries.count != 0{
            noCountriesView.isHidden = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func addCountry(sender: UIButton){
        self.performSegue(withIdentifier: "goToCountries", sender: self)
    }
}
    

extension FirstScreenViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let country = FirstScreenViewController.countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstScreenTableViewCell") as! FirstScreenTableCellTableViewCell
        cell.setCountry(country: country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstScreenViewController.countries.count
        }
    
    }

extension FirstScreenViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            FirstScreenViewController.countries.remove(at: indexPath.row)
            detailsTable.deleteRows(at: [indexPath], with: .left)
            if(FirstScreenViewController.countries.count == 0){
                noCountriesView.isHidden = false
            }
           }
       }
}


    


