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
    
    
}
