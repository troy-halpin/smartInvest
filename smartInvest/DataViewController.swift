//
//  DataViewController.swift
//  smartInvest
//
//  Created by TroyHalpin on 9/24/16.
//  Copyright © 2016 Troy. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var stockPicker: UIPickerView!
    let pickerData = ["AAPL", "GOOG", "PSTG"]
    @IBOutlet weak var webView: UIWebView!
    var rw: CGFloat = 0.0
    
    @IBOutlet weak var StockLabel: UILabel!
    @IBOutlet weak var predictionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockPicker.dataSource = self
        stockPicker.delegate = self
        
        //load html for charts viewer
        let url = NSBundle.mainBundle().URLForResource("charts", withExtension:"html")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        StockLabel.text = "AAPL"
        StockLabel.layer.zPosition = 1000
        predictionLabel.layer.zPosition = 1000
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //picker stuff
    func numberOfComponentsInPickerView(stockPicker: UIPickerView) -> Int {
        return 1
    }
    func pickerView(stockPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(stockPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(stockPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        StockLabel.text = pickerData[row]
    }
    
    

}
