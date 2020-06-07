//
//  AppDelegate.swift
//  Covid
//
//  Created by Bakir Agic on 5/23/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var countries: [Country] = []
     var indexes: [Int] = []

    
    func createListOfCountries() -> [Country] {
        var pomCountries: [Country] = []
        
        pomCountries.append(Country(name: "Bosnia and Herzegovina", confirmed: "Confirmed: 2403", recovered: "Recovered: 1573", deaths: "Deaths: 139"))
        pomCountries.append(Country(name: "Croatia", confirmed: "Confirmed: 2243", recovered: "Recovered: 2023", deaths: "Deaths: 99"))
        pomCountries.append(Country(name: "Serbia", confirmed: "Confirmed: 11159", recovered: "Recovered: 5857", deaths: "Deaths: 238"))
        pomCountries.append(Country(name: "Montenegro", confirmed: "Confirmed: 324", recovered: "Recovered: 315", deaths: "Deaths: 9"))
        pomCountries.append(Country(name: "North Macedonia", confirmed: "Confirmed: 1978", recovered: "Recovered: 1422", deaths: "Deaths: 113"))
        
        return pomCountries

    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        countries = createListOfCountries()
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


}

