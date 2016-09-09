//
//  ViewController.swift
//  ACK
//
//  Created by Edaena Salinas Jasso on 8/27/16.
//  Copyright © 2016 Edaena Salinas Jasso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var ack1: UITextField!

    @IBOutlet weak var ack2: UITextField!

    @IBOutlet weak var ack3: UITextField!

    @IBOutlet weak var ackButton: UIButton!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func checkAck(sender: UITextField) {
       if (!ack1.text!.isEmpty && !ack2.text!.isEmpty && !ack3.text!.isEmpty ) {
            ackButton.enabled = true;
        }
        else {
            ackButton.enabled = false;
        }
    }

    @IBAction func saveAck(sender: UIButton) {
    
        var ackArray = defaults.arrayForKey("AckAppData") as? [[String:[String]]]
        let date = NSDate()
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let components = calendar.components([.Month, .Day, .Year], fromDate: date)
        
        let (month, day, year) = (components.month, components.day, components.year)
        let key = String(month) + "-" + String(day) + "-" + String(year);
        
        // Initialize array if nothing has been save
        if (ackArray == nil) {
            ackArray = []
        }
        
        // If there are 10 remove one
        if (ackArray!.count == 10) {
            ackArray!.removeFirst()
        }
        
        // Save the values
        let acks = [ack1.text!, ack2.text!, ack3.text!]
        let entry = [key: acks]
        
        // Save the array
        ackArray!.append(entry)
        defaults.setValue(ackArray, forKey: "AckAppData")
    }
}

