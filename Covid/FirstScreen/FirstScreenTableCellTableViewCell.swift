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
    @IBOutlet var countryDate: UILabel!

    func setCountry(country: CountryBase){
        countryName.text = country.name
        countryConfirmed.text = "Confirmed:\(country.confirmed)"
        countryRecovered.text = "Recovered:\(country.recovered)"
        countryDeaths.text = "Deaths:\(country.deaths)"
    }
    
    func setCountryDetails(country: CountryBase){
        countryConfirmed.text = "Confirmed:\(country.confirmed)"
        countryRecovered.text = "Recovered:\(country.recovered)"
        countryDeaths.text = "Deaths:\(country.deaths)"
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        countryDate.text = formatter.string(from: country.date)
    }

}
