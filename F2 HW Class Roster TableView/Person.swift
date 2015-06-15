//
//  Person.swift
//  F2 HW Class Roster TableView
//
//  Created by Sau Chung Loh on 6/11/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import Foundation

class Person {
  
  var firstName: String
  var lastName: String
  
  init (firstName : String, lastName : String) {
    self.firstName = firstName
    self.lastName = lastName
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