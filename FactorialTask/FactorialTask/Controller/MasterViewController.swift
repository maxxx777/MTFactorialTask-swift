//
//  MasterViewController.swift
//  FactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

import UIKit


class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FactorialCalculatorOutputInterface {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var buttonCalculate: UIButton!
    
    var factorialCalculator : FactorialCalculator!
    var objects : [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        objects = []
        
        factorialCalculator = FactorialCalculator()
        factorialCalculator.output = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IB Actions
    
    @IBAction func calculateButtonPressed(sender: UIButton) {

        if (textFieldNumber.text?.characters.count == 0) {
            textFieldNumber?.text = "0"
        }
        
        textFieldNumber.resignFirstResponder()
        clearTableData()
        
        //convert string to unsigned value
        let ulvalue = strtoul(textFieldNumber.text!, nil, 0) as UInt
        
        //convert unsigned value to string
        textFieldNumber?.text = String(format: "%lu", ulvalue)
        
        factorialCalculator .calculateFactorialRecordsWithLimit(ulvalue as NSNumber)
    }
    
    @IBAction func ulongButtonPressed(sender: UIButton) {
        
        textFieldNumber?.text = String(format: "%lu", UInt.max)
        
    }
    
    // MARK: - UI
    
    func showRecordInLog(record: String) {
        NSLog("%@", record)
    }
    
    func showRecordInTableView(record: String) {
    
        if objects == nil {
            objects = []
        }
        
        objects?.insert(record, atIndex: (objects?.count)!)
        
        let indexPath = NSIndexPath(forRow: tableView.numberOfRowsInSection(0), inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func clearTableData() {
        
        objects?.removeAll()
        tableView.reloadData()
        
    }
    
    // MARK: - FactorialCalculatorOutputInterface
    
    func onDidCalculateFactorialRecord(record: String) {
        
        showRecordInTableView(record)
        
    }

    // MARK: - Table View

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects![indexPath.row] as String
        cell.textLabel!.text = object
        return cell
    }
    
}
