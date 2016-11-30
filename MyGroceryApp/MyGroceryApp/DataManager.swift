//
//  DataManager.swift
//  MyGroceryApp
//
//  Created by SBulama on 11/29/16.
//  Copyright © 2016 Hasmaya Tech. All rights reserved.
//

import CoreData

enum DataError: Error {
    case BadManagedObjectContext(String)
    case BadEntity(String)
}

class DataManager {
    
    static var shared: DataManager = DataManager()
    var managedObjectContext: NSManagedObjectContext?
    
    var dataList: [GroceryList]
    
    private init() {
        dataList = []
    }
    
    func set(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func create(data: (name: String?, count: Int) /*, description: String?)*/) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "GroceryList", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        // TODO: Implement Me!
        let obj = GroceryList(entity: entity, insertInto: ctx)
        obj.name = data.name
        //obj.count = Int16(data.age)
        //obj.dataDescription = data.description
        _ = try? save()
        
    }
    
    func fetch<T: NSManagedObject>() -> [T] {
        var result: [T]? = nil
        managedObjectContext?.performAndWait {[weak self] in
            do {
                result = try self?.executeFetchRequest()
            }
            catch {
                print(error)
            }
        }
        
        return result ?? []
    }
    
    private func executeFetchRequest<T: NSManagedObject>() throws ->[T]? {
        let request = T.fetchRequest()
        return try request.execute() as? [T]
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}

