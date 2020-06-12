//
//  Reflection+CoreDataClass.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 14/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Reflection)
public class Reflection: NSManagedObject {
    static let shared = Reflection() // Singleton
}
