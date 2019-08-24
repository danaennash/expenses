//
//  Expense+CoreDataProperties.swift
//  Expenses
//
//  Created by Danae N Nash on 8/23/19.
//  Copyright © 2019 Danae N Nash. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var rawDate: NSDate?

}
