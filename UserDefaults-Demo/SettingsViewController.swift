//
//  SettingsViewController.swift
//  UserDefaults-Demo
//
//  Created by Alex Paul on 1/13/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
  
  @IBOutlet weak var unitMeasurementLabel: UILabel!
  
  var currentUnit = UnitMeasurement.miles {
    
    didSet {
      // update the unitMeasurement label
      unitMeasurementLabel.text = currentUnit.rawValue // "Miles" or "Kilometers"
      
      // update value in user defaults
      UserPreference.shared.updateUnitMeasurement(with: currentUnit)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  private func updateUI() {
    // retrieve any values in UserDefaults as needed
    if let unitMeasurement = UserPreference.shared.getUnitMeasurement() {
      currentUnit = unitMeasurement
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    // toggle between "Miles" or "Kilometers"
    
    switch indexPath.row {
    case 0:
      // toggle unit measurement label
      toggleUnitMeasurement()
    default:
      break
    }
  }
  
  private func toggleUnitMeasurement() {
    currentUnit = (currentUnit == UnitMeasurement.miles) ? UnitMeasurement.kilometers : UnitMeasurement.miles
  }
  
  
}
