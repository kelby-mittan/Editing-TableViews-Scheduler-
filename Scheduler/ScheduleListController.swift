//
//  ViewController.swift
//  Scheduler
//
//  Created by Kelby Mittan on 11/20/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class ScheduleListController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    
    var events = [Event]()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTableView.dataSource = self
        
        events = Event.getTestData()
        
    }

    
    @IBAction func updateUIFromUnwindSegue(segue: UIStoryboardSegue) {
        print("adding event")
        
        guard let createEventVC = segue.source as? CreateEventController, let createdEvent = createEventVC.event else {
            fatalError()
        }
        
        events.insert(createdEvent, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        eventTableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}

extension ScheduleListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        let event = events[indexPath.row]
        
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = dateFormatter.string(from: event.date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .insert:
            print("inserting")
        case .delete:
            print("deleting")
            events.remove(at: indexPath.row)
            eventTableView.deleteRows(at: [indexPath], with: .fade)
        default:
            print(".......")
        }
    }
    
    
}

