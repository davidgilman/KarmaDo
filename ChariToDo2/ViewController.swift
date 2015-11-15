//
//  ViewController.swift
//  ChariToDo2
//
//  Created by Monte's Pro 13" on 11/14/15.
//  Copyright © 2015 Monte Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var item: ListItem?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var donation: UITextField!
    
    @IBOutlet weak var saveItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.saveItem{
            return
        }
        if self.itemTextField.text?.characters.count > 0{
            self.item = ListItem(name: self.itemTextField.text!)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            self.view.endEditing(true)
        }
        super.touchesBegan(touches, withEvent:event)
    }
    
}

