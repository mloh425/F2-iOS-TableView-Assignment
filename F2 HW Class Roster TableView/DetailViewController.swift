//
//  DetailViewController.swift
//  F2 HW Class Roster TableView
//
//  Created by Sau Chung Loh on 6/11/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet weak var mottoLabel: UILabel!
  @IBOutlet weak var houseCrestImage: UIImageView!
  var selectedPerson: Person!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.firstNameLabel.text = self.selectedPerson.firstName
    self.lastNameLabel.text = self.selectedPerson.lastName
    self.mottoLabel.text = self.selectedPerson.getMotto()
    self.setColors()
  }
  
  //This function sets the background color and the image of the
  //UIImage as the appropriate sigil and colors per family.
  func setColors() {
    switch self.selectedPerson.lastName {
    case "Stark":
      self.view.backgroundColor = UIColor.whiteColor()
      self.houseCrestImage.image = UIImage(named: "Stark")
    case "Baratheon":
      self.view.backgroundColor = UIColor.yellowColor()
      self.houseCrestImage.image = UIImage(named: "Baratheon")
    case "Lannister":
      self.view.backgroundColor = UIColor.redColor()
      self.houseCrestImage.image = UIImage(named: "Lannister")
      self.firstNameLabel.textColor = UIColor.whiteColor()
      self.lastNameLabel.textColor = UIColor.whiteColor()
      self.mottoLabel.textColor = UIColor.whiteColor()
    case "Targaryen":
      self.houseCrestImage.image = UIImage(named: "Targaryen")
      self.view.backgroundColor = UIColor.orangeColor()
    default:
      self.view.backgroundColor = UIColor.grayColor()
      self.houseCrestImage.image = UIImage(named: "Stark")
      self.firstNameLabel.textColor = UIColor.whiteColor()
      self.lastNameLabel.textColor = UIColor.whiteColor()
      self.mottoLabel.textColor = UIColor.whiteColor()
    }
  }
}
