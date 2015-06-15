//
//  ViewController.swift
//  F2 HW Class Roster TableView
//
//  Created by Sau Chung Loh on 6/9/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  var names = [Person]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self
    self.names.append(Person(firstName: "Tyrion", lastName: "Lannister"))
    self.names.append(Person(firstName: "Jamie", lastName: "Lannister"))
    self.names.append(Person(firstName: "Ned", lastName: "Stark"))
    self.names.append(Person(firstName: "Arya", lastName: "Stark"))
    self.names.append(Person(firstName: "Daenerys", lastName: "Targaryen"))
    self.names.append(Person(firstName: "Renly", lastName: "Baratheon"))
    self.names.append(Person(firstName: "John", lastName: "Snow"))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //First method required to follow the protocol for tableviews
  //Returns the number of cells necessary for the table.
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.names.count
  }
  
  //Second method required to follow the protocol for tableviews
  //Generates and sets what is to be displayed in each cell on the table view.
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let personToDisplay = self.names[indexPath.row]
    cell.textLabel?.text = "\(personToDisplay.firstName) \(personToDisplay.lastName)"
    return cell
  }
  
  //Prepares the information to be shown after the segue on the detail view controller
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailView" {
      var detailViewController = segue.destinationViewController as! DetailViewController
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedPerson = self.names[selectedRow]
      detailViewController.selectedPerson = selectedPerson
    }
  }
}




