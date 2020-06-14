//
//  CountriesTableCell.swift
//  Covid
//
//  Created by Bakir Agic on 5/23/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation

import UIKit

class CountriesTableCell: UITableViewCell {
    
    @IBOutlet var countryName: UILabel!
    
    func setCountryName(country: String){
        countryName.text = country
    }
}
