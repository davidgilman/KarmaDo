//
//  ListItem.swift
//  ChariToDo2
//
//  Created by Monte's Pro 13" on 11/14/15.
//  Copyright © 2015 Monte Thakkar. All rights reserved.
//

import UIKit

class ListItem: NSObject {

    var itemName = ""
    var date:NSDate = NSDate()
    var completed = false
    
    init(name: String) {
        self.itemName = name
    }
}
