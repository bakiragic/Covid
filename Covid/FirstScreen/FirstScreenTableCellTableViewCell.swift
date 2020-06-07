//
//  FirstScreenTableCellTableViewCell.swift
//  Covid
//
//  Created by Bakir Agic on 5/24/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import UIKit

class FirstScreenTableCellTableViewCell: UITableViewCell {

    @IBOutlet var countryName: UILabel!
    @IBOutlet var countryConfirmed: UILabel!
    @IBOutlet var countryRecovered: UILabel!
    @IBOutlet var countryDeaths: UILabel!

    func setCountry(country: CountryBase){
        countryName.text = country.name
        countryConfirmed.text = country.confirmed
        countryRecovered.text = country.recovered
        countryDeaths.text = country.deaths
    }

}
