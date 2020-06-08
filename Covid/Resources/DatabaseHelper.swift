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
                guard let entity = NSEntityDescription.entity(forEntityName: "CountryBase", in: context) else { return }
                
        let poms:[String] = ["Croatia", "Bosnia and Herzegovina", "Montenegro", "North Macedonia", "Serbia"]
        let pomc:[String] = ["Confirmed: 2243", "Confirmed: 2403", "Confirmed: 640", "Confirmed: 2002", "Confirmed: 11159"]
        let pomr:[String] = ["Recovered: 2023", "Recovered: 1573", "Recovered: 640", "Recovered: 1702", "Recovered: 5857"]
        let pomd:[String] = ["Deaths: 99", "Deaths: 139", "Deaths: 23", "Deaths: 100", "Deaths: 239"]
        for pom in 0...4{
            let user = NSManagedObject(entity: entity, insertInto: context)
            user.setValue(pom, forKey: "id")
            print(poms[pom])
            user.setValue(poms[pom], forKey: "name")
            user.setValue(pomc[pom], forKey: "confirmed")
            user.setValue(pomr[pom], forKey: "recovered")
            user.setValue(pomd[pom], forKey: "deaths")
            user.setValue(false, forKey: "selected")
        }
        do{
            try context.save()
        }
        catch let error as NSError{
            print("Could not save", error)
        }
    }
    
    func saveEntry(obj: NSManagedObject){
        let pom1: CountryBase = obj as! CountryBase
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return}
        let context = appD.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "CountryBase", in: context) else { return }
        let user = NSManagedObject(entity: entity, insertInto: context)
        user.setValue(pom1.id, forKey: "id")
        user.setValue(pom1.name, forKey: "name")
        user.setValue(pom1.confirmed, forKey: "confirmed")
        user.setValue(pom1.recovered, forKey: "recovered")
        user.setValue(pom1.deaths, forKey: "deaths")
        user.setValue(pom1.selected, forKey: "selected")
        
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
