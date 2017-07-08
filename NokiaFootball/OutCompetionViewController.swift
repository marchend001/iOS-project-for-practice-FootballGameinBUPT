//
//  OutCompetionViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 17/1/5.
//  Copyright © 2017年 龚茜. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class OutCompetionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var outCompetion:NSMutableArray!
    let type = "OutPk"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bl = CompetitionBL()
        outCompetion = bl.findTypeData(type)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return outCompetion.count 
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! OutCollectionViewCell
        //cell.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width:self.view.frame.width, height: 200))
       // cell.sizeThatFits(CGSize(width: self.collectionView!.frame.width, height: 150))
        //cell.imageView.sizeThatFits(CGSize(width: self.collectionView!.frame.width, height: 150))

        let selectRow = indexPath.section+indexPath.row
        let name = String(format: "%@%d","OutPk",selectRow)
        cell.imageView.image = UIImage(named: name)
        // Configure the cell
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if(segue.identifier == "showOutCompetion"){
            
            let outDetail = segue.destinationViewController as! OutCompetionDetailViewController
            
            let cell = sender as! OutCollectionViewCell
            let indexPath = self.collectionView!.indexPathForCell(cell)
            let selectedRow = indexPath?.section
            outDetail.competion = outCompetion.objectAtIndex(selectedRow!) as! Competion
            NSLog("%d",outCompetion.count)
            NSLog("%d",selectedRow!)
            
        }
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
