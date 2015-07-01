//
//  PersonCell.swift
//  F2 HW Class Roster TableView
//
//  Created by Sau Chung Loh on 6/30/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
  @IBOutlet weak var personImageView: UIImageView!
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
}