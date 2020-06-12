//
//  CountryBase.swift
//  Covid
//
//  Created by Bakir Agic on 6/7/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation
import CoreData

class CountryBase: NSManagedObject{
    @NSManaged var id: Int
    @NSManaged var name: String
    @NSManaged var confirmed: String
    @NSManaged var recovered: String
    @NSManaged var deaths: String
    @NSManaged var selected: Bool
    @NSManaged var date: String
    
    class func newInstance(id: Int, name:String, confirmed: String, recovered: String, deaths: String, selected: Bool, date: String, context: NSManagedObjectContext) -> CountryBase {
        let item: CountryBase = NSEntityDescription.insertNewObject(forEntityName: "CountryBase", into: context) as! CountryBase
        item.id = id
        item.name = name
        item.confirmed = confirmed
        item.recovered = recovered
        item.deaths = deaths
        item.selected = selected
        item.date = date
        return item
    }
    
    func sort(c1: CountryBase, c2: CountryBase) throws -> Bool{
        if c1.id < c2.id{
            return true
        }
        else{
            return false
        }
    }
}
