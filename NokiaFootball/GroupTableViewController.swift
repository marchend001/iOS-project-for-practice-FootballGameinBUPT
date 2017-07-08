//
//  GroupTableViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 17/1/14.
//  Copyright © 2017年 龚茜. All rights reserved.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    var groupCompetion: NSMutableArray!
    var resDict = NSMutableDictionary()
    var arrayComeptionList:NSArray!
    var competionType: NSString!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bl = CompetitionBL()
        groupCompetion = bl.findTypeData(competionType)
        
        for item in groupCompetion{
            
            let competion = item as! Competion
            let allkey = resDict.allKeys as NSArray
            //NSLog("%s",competion.CompetionDate!)
            if(allkey.containsObject(competion.CompetionDate!)){
                
                var value = resDict.objectForKey(competion.CompetionDate!) as! NSMutableArray
                value.addObject(competion)
            }else{
                var value = NSMutableArray()
                value.addObject(competion)
                resDict.setObject(value, forKey: competion.CompetionDate!)
            }
        }
        
        let keys = self.resDict.allKeys as NSArray
        self.arrayComeptionList = keys.sortedArrayUsingSelector("compare:") as NSArray

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
        let keys = resDict.allKeys as NSArray
        return keys.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        let strDate = self.arrayComeptionList.objectAtIndex(section) as! NSString
        
        let groupCom = self.resDict.objectForKey(strDate) as! NSArray
        return groupCom.count
    }



    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let strDate = self.arrayComeptionList.objectAtIndex(section) as! String
       
        return strDate
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let comDate = self.arrayComeptionList.objectAtIndex(indexPath.section) as! NSString
        let groupcom = self.resDict.objectForKey(comDate) as! NSArray
        let competion = groupcom.objectAtIndex(indexPath.row) as! Competion
        
        cell.textLabel?.text = competion.CompetionPk as! String

        // Configure the cell...

        return cell
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        
        var listTitles = NSMutableArray()
        
        for item in self.arrayComeptionList{
            
            let title = (item as! NSString).substringFromIndex(5)
            listTitles.addObject(title)
        }
        
        return listTitles as? [String]
    }
    

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "showGroup"){
            
            let topDetail = segue.destinationViewController as! TopCompetionDetailViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView!.indexPathForCell(cell)
            let selectedRow = indexPath?.section
            
            let strDate = self.arrayComeptionList.objectAtIndex(selectedRow!)
            let groupcom = resDict.objectForKey(strDate) as! NSArray
            let competion = groupcom.objectAtIndex((indexPath?.row)!) as! Competion
            topDetail.competion = competion
            let title = competion.CompetionPk! as NSString
            topDetail.title = title.substringFromIndex(7)
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
