//
//  DatabaseHelper.swift
//  Covid
//
//  Created by Bakir Agic on 6/7/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
    
    static let dbHelper = DatabaseHelper()
    
    func saveAllInitial(){
        
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return}
        let context = appD.persistentContainer.viewContext
       // guard let entity = NSEntityDescription.entity(forEntityName: "CountryBase", in: context) else { return }
                
        var countriespom: [CountryBase] = []
        countriespom.append(CountryBase.newInstance(id: 0, name: "Bosnia and Herzegovina", confirmed: "Confirmed: 2403", recovered: "Recovered: 1573", deaths: "Deaths: 139", selected: false, context: context))
        countriespom.append(CountryBase.newInstance(id: 1, name: "Croatia", confirmed: "Confirmed: 2243", recovered: "Recovered: 2023", deaths: "Deaths: 99", selected: false, context: context))
        countriespom.append(CountryBase.newInstance(id: 2, name: "Serbia", confirmed: "Confirmed: 11159", recovered: "Recovered: 5857", deaths: "Deaths: 239", selected: false, context: context))
        countriespom.append(CountryBase.newInstance(id: 3, name: "Montenegro", confirmed: "Confirmed: 640", recovered: "Recovered: 640", deaths: "Deaths: 23", selected: false, context: context))
        countriespom.append(CountryBase.newInstance(id: 4, name: "North Macedonia", confirmed: "Confirmed: 2002", recovered: "Recovered: 1702", deaths: "Deaths: 109", selected: false, context: context))
        
     /*   for pom in 0...4{
            let user = NSManagedObject(entity: entity, insertInto: context)
            user.setValue(pom, forKey: "id")
            user.setValue(countriespom[pom].name, forKey: "name")
            user.setValue(countriespom[pom].confirmed, forKey: "confirmed")
            user.setValue(countriespom[pom].recovered, forKey: "recovered")
            user.setValue(countriespom[pom].deaths, forKey: "deaths")
            user.setValue(countriespom[pom].selected, forKey: "selected")
        }*/
        do{
            try context.save()
        }
        catch let error as NSError{
            print("Could not save", error)
        }
    }
    
    
    func read(id: Int) -> CountryBase{
        var country = [CountryBase]()
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return country[0]}
               let context = appD.persistentContainer.viewContext
               let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryBase")
               fetchReq.predicate = NSPredicate(format: "%K == %i", "id",  id)

               
               do{
                   country = try context.fetch(fetchReq) as! [CountryBase]
               }
               catch{
                   print("Failed retrieving data")
               }
        return country[0]

    }
    
    func readAll() -> [CountryBase]{
        var country = [CountryBase]()
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return country}
        let context = appD.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryBase")
        fetchReq.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
           
        do{
            country = try context.fetch(fetchReq) as! [CountryBase]
        }
        catch{
            print("Failed retrieving data")
        }
        return country
    }
    
    func update(id: Int, value: Bool){
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return}
        let context = appD.persistentContainer.viewContext
        let fetchReq:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "CountryBase")
        fetchReq.predicate = NSPredicate(format: "%K == %i", "id", id)
        
        do{
            let test = try context.fetch(fetchReq)
            let updateObj = test as! [NSManagedObject]
            let pomobj: [CountryBase] = updateObj as! [CountryBase]
            print("Update id drzave \(pomobj[0].name)")
            updateObj[0].setValue(value, forKey: "selected")
            do{
                try context.save()
            }
            catch{
                print("error")
            }
        }
        catch{
            print("error")
        }
    }
    
}
