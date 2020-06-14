//
//  AppDelegate.swift
//  Covid
//
//  Created by Bakir Agic on 5/23/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var detailsListCountry: String?
    var firstScreenCountries: [CountryBase.Country] = []
    lazy var persistentContainer: NSPersistentContainer = {
           
    let container = NSPersistentContainer(name: "Covid")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                   fatalError("Unresolved error \(error), \(error.userInfo)")
               }
           })
           return container
    }()
    
    func checkDoubleValue(country: String) -> Bool{
        return firstScreenCountries.contains(where: {$0.name == country})
    }
    
    func createData(){
        DatabaseHelper.dbHelper.saveAllInitial()
    }
    
    func insert(element: String){
        let pom = DatabaseHelper.dbHelper.readByName(name: element)
        var c:Int = 0
        var r:Int = 0
        var d:Int = 0
        if checkDoubleValue(country: pom[0].name) == false{
            if pom.count > 1{
                for i in pom{
                    c += i.confirmed
                    r += i.recovered
                    d += i.deaths
                }
                let cpom = CountryBase.Country(id: -1, name: element, confirmed: c, recovered: r, deaths: d)
                firstScreenCountries.append(cpom)
            }
            else{
                let cpom = CountryBase.Country(id: -1, name: element, confirmed: pom[0].confirmed, recovered: pom[0].recovered, deaths: pom[0].deaths)
                firstScreenCountries.append(cpom)
            }
        }
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
               
        let result = DatabaseHelper.dbHelper.readAll()
        var names: [String] = []
        if result.count == 0{
            createData()
        }
        else{
            for i in result{
                if i.selected == true{
                    names.append(i.name)
                }
            }
            for j in names{
                insert(element: j)
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
   
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }


}

