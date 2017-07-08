//
//  CompetionViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/23.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import UIKit

class CompetionViewController: UITableViewController {
    
    var competionCount:NSArray = ["小组赛","淘汰赛","半决赛","决赛","整体总览"]
   // competionCount = NSArray("","","")

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
        return competionCount.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CellIdentifier"
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? UITableViewCell
        cell.textLabel?.text = competionCount.objectAtIndex(indexPath.row) as? String

        // Configure the cell...

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 0){
            
            let groupCompCtrl:GroupTableViewController!
            groupCompCtrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GroupCom") as! GroupTableViewController
            groupCompCtrl.competionType = "GroupPk"
            self.navigationController?.pushViewController(groupCompCtrl, animated: true)
            groupCompCtrl.title = "小组赛"
            
        }
        if(indexPath.row == 4){
           // NSLog("successful")
            //tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let groupCompCtrl:GroupCompetionViewController!
           // groupCompCtrl = GroupCompetionViewController(nibName:"GroupCompetionViewController",bundle: nil)
            groupCompCtrl = UIStoryboard(name:"Main",bundle: nil).instantiateViewControllerWithIdentifier("Group") as! GroupCompetionViewController
            //NSLog("successful")
            self.navigationController?.pushViewController(groupCompCtrl, animated: true)
            groupCompCtrl.title = "赛程总览"
        }
        
        if(indexPath.row == 1){
            
            let outCompCtrl:OutCompetionViewController!
            outCompCtrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Out") as! OutCompetionViewController
            
            self.navigationController?.pushViewController(outCompCtrl, animated: true)
            outCompCtrl.title = "淘汰赛"
        }
        
        if(indexPath.row == 2){
            
            let topCompCtrl:TopCompetionViewController!
            topCompCtrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Top") as! TopCompetionViewController
            topCompCtrl.competionType = "SemiPk"
            self.navigationController?.pushViewController(topCompCtrl, animated: true)
            topCompCtrl.title = "半决赛"
            
        }
        if(indexPath.row == 3){
            
            let topCompCtrl:TopCompetionViewController!
            topCompCtrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Top") as! TopCompetionViewController
            
            
            topCompCtrl.competionType = "TopPk"
            self.navigationController?.pushViewController(topCompCtrl, animated: true)
            topCompCtrl.title = "决赛"
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
