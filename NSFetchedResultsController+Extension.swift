//
//  NSFetchedResultsController+Utilites.swift
//  What to Cook
//
//  Created by Виталий Кузьменко on 16/08/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit
import CoreData

extension NSFetchedResultsController {

    convenience init(entityName: String, predicate: NSPredicate?, sortDescriptorKey:String?, context: NSManagedObjectContext) {
        
        let sortDescriptor = NSSortDescriptor(key: sortDescriptorKey!, ascending: true)
        
        var request = NSFetchRequest(entityName: entityName)
        request.predicate = predicate
        request.sortDescriptors = [sortDescriptor];
        
        self.init(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.performFetch(nil)
    }
    
}