//
//  SettingsViewController.swift
//  tips
//
//  Created by Kurt Ruppel on 12/13/14.
//  Copyright (c) 2014 kruppel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentages = [0.18, 0.2, 0.22]
        var defaultTipPercentage = defaults.doubleForKey("tip_percentage")
        var selectedIndex = find(tipPercentages, defaultTipPercentage) ?? 0
        tipControl.selectedSegmentIndex = selectedIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onTipAmountChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        defaults.setDouble(tipPercentage, forKey: "tip_percentage")
    }

    @IBAction func onDoneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
