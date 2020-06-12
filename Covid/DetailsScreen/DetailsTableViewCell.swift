//
//  DetailsTableViewCell.swift
//  Covid
//
//  Created by Bakir Agic on 6/12/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation
import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet var countryConfirmed: UILabel!
    @IBOutlet var countryRecovered: UILabel!
    @IBOutlet var countryDeaths: UILabel!
    @IBOutlet var countryDate: UILabel!
    
    func setCountryDetails(country: CountryBase){
        countryConfirmed.text = country.confirmed
        countryRecovered.text = country.recovered
        countryDeaths.text = country.deaths
        countryDate.text = country.date
    }

}
