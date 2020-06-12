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
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"


                
        var countriespom: [CountryBase] = []
        countriespom.append(CountryBase.newInstance(id: 0, name: "Bosnia and Herzegovina", confirmed: "Confirmed: 2704", recovered: "Recovered: 2023", deaths: "Deaths: 160", selected: false, date: "01.06.2020", context: context))
        countriespom.append(CountryBase.newInstance(id: 1, name: "Croatia", confirmed: "Confirmed: 2247", recovered: "Recovered: 2126", deaths: "Deaths: 104", selected: false, date: "06.01.2020.", context: context))
        countriespom.append(CountryBase.newInstance(id: 2, name: "Serbia", confirmed: "Confirmed: 11823", recovered: "Recovered: 11348", deaths: "Deaths: 249", selected: false, date: "01.06.2020", context: context))
        countriespom.append(CountryBase.newInstance(id: 3, name: "Montenegro", confirmed: "Confirmed: 324", recovered: "Recovered: 315", deaths: "Deaths: 9", selected: false, date: "01.06.2020", context: context))
        countriespom.append(CountryBase.newInstance(id: 4, name: "North Macedonia", confirmed: "Confirmed: 3025", recovered: "Recovered: 1646", deaths: "Deaths: 153", selected: false, date: "01.06.2020", context: context))
         countriespom.append(CountryBase.newInstance(id: 5, name: "Slovenia", confirmed: "Confirmed: 1485", recovered: "Recovered: 1359", deaths: "Deaths: 109", selected: false, date: "01.06.2020", context: context))
        countriespom.append(CountryBase.newInstance(id: 6, name: "Bosnia and Herzegovina", confirmed: "Confirmed: 2901", recovered: "Recovered: 2115", deaths: "Deaths: 157", selected: false, date: "12.06.2020", context: context))
        
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
    
    func readByName(name: String) -> [CountryBase]{
        var country = [CountryBase]()
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return country}
        let context = appD.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryBase")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)

               
               do{
                   country = try context.fetch(fetchReq) as! [CountryBase]
               }
               catch{
                   print("Failed retrieving data")
               }
        return country
    }
    
    func readAll() -> [CountryBase]{
        var country = [CountryBase]()
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return country}
        let context = appD.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryBase")
        fetchReq.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
           
        do{
            country = try context.fetch(fetchReq) as! [CountryBase]
        }
        catch{
            print("Failed retrieving data")
        }
        return country
    }
    
    func readDistinctNamesCount() -> Int{
        var names:[String] = []
        let column = "name"
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return 0}
        let context = appD.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryBase")
        request.resultType = .dictionaryResultType
        request.returnsDistinctResults = true
        request.propertiesToFetch = [column]
        if let res = try? context.fetch(request) as? [[String: String]] {
            names = res.compactMap { $0[column] }
        }
        return names.count
    }
    
    func update(id: Int, value: Bool){
        guard let appD = UIApplication.shared.delegate as? AppDelegate else{return}
        let context = appD.persistentContainer.viewContext
        let fetchReq:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "CountryBase")
        fetchReq.predicate = NSPredicate(format: "%K == %i", "id", id)
        
        do{
            let test = try context.fetch(fetchReq)
            let updateObj = test as! [NSManagedObject]
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
