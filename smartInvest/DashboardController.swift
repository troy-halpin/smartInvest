//
//  DashboardController.swift
//  smartInvest
//
//  Created by TroyHalpin on 9/24/16.
//  Copyright © 2016 Troy. All rights reserved.
//




/*
 
 This would be for a later implementation when we were able to display data for multiple stocks,
 of the user's choice. Made this first before cutting back
 
 */


import UIKit

class DashboardController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var stocksTable: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    let defaults = NSUserDefaults.standardUserDefaults()
    var stocks: [String] = []
    var filteredStocks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tempClassArray = defaults.valueForKey("Stocks") {
            stocks = tempClassArray as! [String]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //adds a stock to the table
    @IBAction func addBtn(sender: AnyObject) {
        let alert = UIAlertController(title: "New Stock",
                                      message: "Add a new stock",
                                      preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        self.stocks.append(textField!.text!)
                                        NSUserDefaults.standardUserDefaults().setObject(self.stocks, forKey: "Stocks")
                                        self.stocksTable.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
                              animated: true,
                              completion: nil)
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell!.textLabel!.text = stocks[indexPath.row]
        
        return cell!
    }
    
    /*func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredStocks = stocks.filter { stock in
            return candy.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }*/


}
