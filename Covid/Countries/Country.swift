//
//  Country.swift
//  Covid
//
//  Created by Bakir Agic on 5/23/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation

class Country{
   
    var name: String
    var confirmed: String
    var recovered: String
    var deaths: String
    var selected: Bool
    
    
    init (name: String, confirmed: String, recovered: String, deaths: String){
        self.name = name
        self.confirmed = confirmed
        self.recovered = recovered
        self.deaths = deaths
        self.selected = false
    }
    
    func equal(country: Country)->Bool{
        if self.name == country.name{
            return true
        }
        else{
            return false
        }
    }
}

