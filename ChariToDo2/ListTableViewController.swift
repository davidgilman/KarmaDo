//
//  ListTableViewController.swift
//  ChariToDo2
//
//  Created by Monte's Pro 13" on 11/14/15.
//  Copyright © 2015 Monte Thakkar. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var deadline: UILabel!
    
    @IBAction func cancelItem(segue: UIStoryboardSegue) {
        
    }
    
    var listArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.81, green:0.85, blue:0.86, alpha:0.7)
        loadInitialData()

    }
    
    func loadInitialData() {
//        let item1 = ListItem(name: "Item 1.. yay!")
//        self.listArray.addObject(item1)
//        let item2 = ListItem(name: "Item 2.. keep it coming!")
//        self.listArray.addObject(item2)
//        let item3 = ListItem(name: "Item 3.. heh!")
//        self.listArray.addObject(item3)
    }
    
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        
        var source: ViewController = segue.sourceViewController as! ViewController
        
        var addItem: ListItem = source.item!
        
        //if addItem != nil{
            
            self.listArray.addObject(addItem)
            
            self.tableView.reloadData()
            
      //  }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listArray.count
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CellPrototype"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: cellIdentifier)
        }
        
   //     tableView.registerClass(<#T##aClass: AnyClass?##AnyClass?#>, forHeaderFooterViewReuseIdentifier: <#T##String#>)
        
       // var cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath)

        let listItem: ListItem = self.listArray.objectAtIndex(indexPath.row) as! ListItem
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "dd-MM-yyy"
        let strDate = dateformatter.stringFromDate(listItem.date)
    
        print("date:", strDate)
        
        cell.textLabel?.text = listItem.itemName
        cell.detailTextLabel?.text = strDate
        
        if listItem.completed {
            cell.accessoryType = .Checkmark
        }
        else {
        cell.accessoryType = .None
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:
        
        NSIndexPath!) {
            
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
            let tappedItem: ListItem = self.listArray.objectAtIndex(indexPath.row) as!
                
            ListItem
            
            tappedItem.completed = !tappedItem.completed
            
            tableView.reloadData()
            
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            listArray.removeObjectAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
