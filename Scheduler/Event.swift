//
//  Event.swift
//  Scheduler
//
//  Created by Kelby Mittan on 11/20/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

struct Event {
    var date: Date
    var name: String
    
    static func getTestData() -> [Event] {
        var events = [Event]()
        
        let eventNames = ["code", "Unit Assessment", "iOS Soho", "Ladies Night Out"]
        
        for name in eventNames {
            let event = Event(date: Date(), name: name)
            events.append(event)
        }
        
        return events
    }
    
}
