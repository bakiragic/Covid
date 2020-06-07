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
    }


    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        detailsTable.reloadData()
        hideShowViews()
    }
    
    func hideShowViews(){
       // if countriesCount() != 0{
        if appDelegate.indexes.count != 0{
                   noCountriesView.isHidden = true
                   detailsTable.isHidden = false
               }
               else{
                   noCountriesView.isHidden = false
                   detailsTable.isHidden = true
                   
               }
    }
    
    func countriesCount()->Int{
        var pom:Int = 0
        for element in appDelegate.countries{
            if element.selected == true{
                pom += 1
            }
        }
        return pom
    }

   
    @IBAction func addCountry(sender: UIButton){
       // self.performSegue(withIdentifier: "goToCountries", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let countriesVC = storyboard.instantiateViewController(identifier: "CountriesViewController") as! CountriesViewController
        show(countriesVC, sender: self)
    }
    
    }

    

extension FirstScreenViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = appDelegate.countries[appDelegate.indexes[indexPath.row]]
       // let country = appDelegate.countries[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstScreenTableViewCell") as! FirstScreenTableCellTableViewCell
            cell.setCountry(country: country)
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appDelegate.indexes.count//countriesCount()
    }
    
    }

extension FirstScreenViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
           // First.countries.remove(at: indexPath.row)
            appDelegate.countries[indexPath.row].selected = false
            appDelegate.indexes.removeLast()
            detailsTable.deleteRows(at: [indexPath], with: .left)
            hideShowViews()
           }
       }
}


    


