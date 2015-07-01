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
  var myInfo = [String : Person]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let peopleFromArchive = self.loadFromArchive() {
      self.names = peopleFromArchive
    } else {
      self.loadPeopleFromPlist()
      self.saveToArchive()
    }
    self.tableView.dataSource = self
  }
  
  private func loadPeopleFromPlist() {
    if let peoplePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"),
      peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String : String]]{
      for object in peopleObjects {
        if let firstName = object["FirstName"], lastName = object["LastName"] {
          let person = Person(firstName: firstName, lastName: lastName)
          self.names.append(person)
        }
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.saveToArchive()
    self.tableView.reloadData()
  }
  
  //First method required to follow the protocol for tableviews
  //Returns the number of cells necessary for the table.
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.names.count
  }
  
  //Second method required to follow the protocol for tableviews
  //Generates and sets what is to be displayed in each cell on the table view.
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
    cell.backgroundColor = UIColor.whiteColor()
    cell.personImageView.layer.cornerRadius = 15
    cell.personImageView.layer.masksToBounds = true;
    cell.personImageView.layer.borderWidth = 1
    cell.personImageView.layer.borderColor = UIColor.blackColor().CGColor
    let personToDisplay = self.names[indexPath.row]

    if let image = personToDisplay.image {
      cell.personImageView.image = image
    }
    cell.firstNameLabel.text = personToDisplay.firstName
    cell.lastNameLabel.text = personToDisplay.lastName
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    if let lastSelectedName = userDefaults.objectForKey("LastSelected") as? String where lastSelectedName == personToDisplay.firstName {
      cell.backgroundColor = UIColor.cyanColor()
    }
    return cell
  }
  
  //Prepares the information to be shown after the segue on the detail view controller
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailView" {
      if let detailViewController = segue.destinationViewController as? DetailViewController {
        if let indexPath = self.tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedPerson = self.names[selectedRow]
          detailViewController.selectedPerson = selectedPerson
          let userDefaults = NSUserDefaults.standardUserDefaults()
          userDefaults.setObject(selectedPerson.firstName, forKey: "LastSelected")
          userDefaults.synchronize()
        }
      }
    }
  }
  
  func saveToArchive() {
    //Gets the archive path
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      NSKeyedArchiver.archiveRootObject(self.names, toFile: archivePath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Person]? {
    //If archivePath exists, use it. If array is not nil, load the array.
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Person] {
        return peopleFromArchive
      }
    }
    return nil
  }

}




