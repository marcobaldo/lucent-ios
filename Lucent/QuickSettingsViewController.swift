//
//  QuickSettingsController.swift
//  Lucent
//
//  Created by Marc on 09/04/2016.
//  Copyright © 2016 Marc Obaldo. All rights reserved.
//

import UIKit

protocol QuickSettingSelectionDelegate : class {
    func quickSettingSelected(setting : QuickSetting)
}

class QuickSettingsViewController: UITableViewController {
    
    var profiles = [QuickSetting]()
    weak var delegate : QuickSettingSelectionDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder);
        
        self.profiles.append(QuickSetting(mode: LucentMode.Off, name: "Off", options: ""))
        self.profiles.append(QuickSetting(mode: LucentMode.Static, name: "Static white", options: "255255255255"))
        self.profiles.append(QuickSetting(mode: LucentMode.Static, name: "Kathy (Philips Hue)", options: "230000255255"))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.rowHeight = 90.0
        self.tableView.layoutMargins = UIEdgeInsetsZero
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.profiles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ProfileTableViewCell
        
        let profile = self.profiles[indexPath.row]
        cell.quickSettingName?.text = profile.name
        cell.quickSettingName?.textColor = profile.getForegroundColor()
        cell.backgroundColor = profile.getBackgroundColor()

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let profile = self.profiles[indexPath.row]
        self.delegate?.quickSettingSelected(profile)
        
        if let detailViewController = self.delegate as? QuickSettingsDetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
