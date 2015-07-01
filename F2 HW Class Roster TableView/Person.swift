//
//  Person.swift
//  F2 HW Class Roster TableView
//
//  Created by Sau Chung Loh on 6/11/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
  var firstName : String
  var lastName : String
  var image : UIImage?
  
  init (firstName : String, lastName : String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  required init(coder aDecoder: NSCoder) {
    self.firstName = aDecoder.decodeObjectForKey("firstName") as!String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    self.image = aDecoder.decodeObjectForKey("image") as? UIImage
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.firstName, forKey: "firstName")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    aCoder.encodeObject(self.image, forKey: "image")
  }
  
  func getMotto() -> String {
    switch self.lastName {
    case "Stark":
      return "Winter is Coming"
    case "Baratheon":
      return "Ours is the Fury"
    case "Lannister":
      return "A Lannister always pays his debts"
    case "Targaryen":
      return "Fire and Blood"
    default:
      return "You know nothing, John Snow."
    }
  }
}