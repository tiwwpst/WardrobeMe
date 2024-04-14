//
//  Outfits+CoreDataProperties.swift
//  WardrobeME
//
//  Created by Maxim Sukhoparov on 09.07.2021.
//
//

import Foundation
import CoreData


extension Outfits {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Outfits> {
        return NSFetchRequest<Outfits>(entityName: "Outfits")
    }

    @NSManaged public var id: Int64
    @NSManaged public var mood: String?
    @NSManaged public var style: String?
    @NSManaged public var weather: String?

}

extension Outfits : Identifiable {

}
