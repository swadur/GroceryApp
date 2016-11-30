//
//  GroceryListProperties.swift
//  MyGroceryApp
//
//  Created by SBulama on 11/29/16.
//  Copyright © 2016 Hasmaya Tech. All rights reserved.
//

import Foundation
import CoreData

extension GroceryList {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryList> {
        return NSFetchRequest<GroceryList>(entityName: "GroceryList");
    }
    
    @NSManaged public var count: Int16
    @NSManaged public var name: String?
}
