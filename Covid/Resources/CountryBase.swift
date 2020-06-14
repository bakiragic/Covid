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
    @NSManaged var confirmed: Int
    @NSManaged var recovered: Int
    @NSManaged var deaths: Int
    @NSManaged var selected: Bool
    @NSManaged var date: Date
    
    class func newInstance(id: Int, name:String, confirmed: Int, recovered: Int, deaths: Int, selected: Bool, date: String, context: NSManagedObjectContext) -> CountryBase {
        let item: CountryBase = NSEntityDescription.insertNewObject(forEntityName: "CountryBase", into: context) as! CountryBase
        item.id = id
        item.name = name
        item.confirmed = confirmed
        item.recovered = recovered
        item.deaths = deaths
        item.selected = selected
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        item.date = formatter.date(from: date)!
        return item
    }
    
    class Country{
    
        var id:Int
        var name: String
        var confirmed: Int
        var recovered: Int
        var deaths: Int
        var date:Date
     

        init (id:Int, name: String, confirmed: Int, recovered: Int, deaths: Int){
            self.id = id
         self.name = name
         self.confirmed = confirmed
         self.recovered = recovered
         self.deaths = deaths
         let formatter = DateFormatter()
         formatter.dateStyle = .long
         formatter.timeStyle = .none
         formatter.dateFormat = "yyyy-MM-dd"
            self.date = formatter.date(from: "2000-01-01")!
     }
        init (id:Int, name: String, confirmed: Int, recovered: Int, deaths: Int, date: Date){
            self.id = id
            self.name = name
            self.confirmed = confirmed
            self.recovered = recovered
            self.deaths = deaths
            self.date = date
        }
}
}
