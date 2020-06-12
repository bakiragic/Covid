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
    
    var countriesList:[CountryBase] = []
    @IBOutlet var TopBar: TopBarView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var detailsTable: UITableView!
    @IBOutlet var noCountriesView: UIView!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TopBar.setTopBar(image: "add", text: "NEW COVID INFORMATION")
        checkIndexes()
        detailsTable.dataSource = self
        detailsTable.delegate = self
        detailsTable.reloadData()
    }


    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        checkIndexes()
        countriesList = countriesList.sorted { $0.id < $1.id}
        hideShowViews()
        detailsTable.reloadData()
    }
    
    func checkListForDoubleValues(country: CountryBase) -> Bool{
        var pom: Bool = true
        for element in countriesList{
            if(element.id == country.id){
                pom = false
            }
        }
        return pom
    }
    
    func checkIndexes(){
        let pom:[CountryBase] = DatabaseHelper.dbHelper.readAll()
        for el in pom{
            if(el.selected == true){
                if(countriesList.count != 0){
                    if(checkListForDoubleValues(country: el) == true){
                        countriesList.append(el)
                    }
                }
                else{
                    countriesList.append(el)
                }
            }
        }
    }
    
    func hideShowViews(){
        if countriesList.count != 0{
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
            let country = countriesList[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstScreenTableViewCell") as! FirstScreenTableCellTableViewCell
            cell.setCountry(country: country)
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countriesList.count
    }
    
    }

extension FirstScreenViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            DatabaseHelper.dbHelper.update(id: countriesList[indexPath.row].id, value: false)
            countriesList.remove(at: indexPath.row)
            detailsTable.deleteRows(at: [indexPath], with: .left)
            hideShowViews()
           }
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let country = DatabaseHelper.dbHelper.read(id: countriesList[indexPath.row].id)
        appDelegate.detailsListCountry = country.name
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        show(detailsVC, sender: self)
    }
}


    


