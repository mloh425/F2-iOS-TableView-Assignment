//
//  DetailViewController.swift
//  F2 HW Class Roster TableView
//
//  Created by Sau Chung Loh on 6/11/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var mottoLabel: UILabel!
  @IBOutlet weak var houseCrestImage: UIImageView!
  var selectedPerson: Person!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.mottoLabel.text = self.selectedPerson.getMotto()
    self.setColors()
    self.setupTextFields()
  }
  
  private func setupTextFields() {
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    self.firstNameTextField.tag = 0
    self.lastNameTextField.tag = 1
    self.firstNameTextField.text = self.selectedPerson.firstName
    self.lastNameTextField.text = self.selectedPerson.lastName
    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      //set the first name
      self.selectedPerson.firstName =  textField.text
    } else {
      //set the last name
      self.selectedPerson.lastName = textField.text
    }
  }
  
  @IBAction func photoButtonPressed(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    let image = info[UIImagePickerControllerEditedImage] as? UIImage
    self.imageView.image = image
    self.selectedPerson.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
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
      self.mottoLabel.textColor = UIColor.whiteColor()
    case "Targaryen":
      self.houseCrestImage.image = UIImage(named: "Targaryen")
      self.view.backgroundColor = UIColor.orangeColor()
    default:
      self.view.backgroundColor = UIColor.grayColor()
      self.houseCrestImage.image = UIImage(named: "Stark")
      self.mottoLabel.textColor = UIColor.whiteColor()
    }
  }
}
