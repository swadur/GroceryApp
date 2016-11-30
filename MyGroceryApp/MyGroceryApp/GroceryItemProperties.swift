//
//  GroceryItemProperties.swift
//  MyGroceryApp
//
//  Created by SBulama on 11/29/16.
//  Copyright © 2016 Hasmaya Tech. All rights reserved.
//

import Foundation
import CoreData

extension GroceryItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryItem> {
        return NSFetchRequest<GroceryItem>(entityName: "GroceryItem");
    }
    
    @NSManaged public var itemQty: Int16
    @NSManaged public var itemName: String?
    
}

