//
//  CreateEventController.swift
//  Scheduler
//
//  Created by Kelby Mittan on 11/20/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class CreateEventController: UIViewController {
    
    @IBOutlet weak var createEventTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createEventTextField.delegate = self
        event = Event(date: Date(), name: "Swift Lab")
    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        event?.date = sender.date
    }
    
    
    
}

extension CreateEventController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        event?.name = textField.text ?? "No Event"
        return true
    }
}
