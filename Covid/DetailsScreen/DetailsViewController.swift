//
//  DetailsViewController.swift
//  Covid
//
//  Created by Bakir Agic on 6/12/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController{
    
    @IBOutlet var topBar: TopBarView!
    @IBOutlet var exitButton: UIButton!
    @IBOutlet var dateTable: UITableView!
    var detailsTableDates: [CountryBase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appD = UIApplication.shared.delegate as! AppDelegate
        topBar.setTopBar(image: "close", text: appD.detailsListCountry!)
        dateTable.dataSource = self
    }
    
    @IBAction func backToFirstScreen(sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        if appD.detailsListCountry?.count != 0{
            detailsTableDates = DatabaseHelper.dbHelper.readByName(name: appD.detailsListCountry!)
        }
    }
    
}

extension DetailsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsTableDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as! DetailsTableViewCell
       cell.setCountryDetails(country: detailsTableDates[indexPath.row])
        return cell
    }
}
