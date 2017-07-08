//
//  FantasticCollectionViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/28.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FantasticCollectionViewController: UICollectionViewController {
    
    let fantasticCount: NSArray = ["小组赛","淘汰赛","半决赛","巅峰对决","进球集锦","球王风采"]

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 3
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "Cell"
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! FantasticViewCell
        
        let type = fantasticCount.objectAtIndex(2*indexPath.section+indexPath.row) as! String
        cell.imageView.image = UIImage(named: type)
        cell.label.text =  type
       // cell.imageView.frame = CGRect(origin: CGPoint(x: cell.x, y: cell.y), size: CGSize(width:self.view.frame.width, height: 200))
    
        // Configure the cell
    
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if((indexPath.section == 0)&&(indexPath.row == 0)){
            
            let groupPicViewController: GroupPicViewController!
            groupPicViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GroupPicCollection") as! GroupPicViewController
            
            let selectRow = indexPath.section*2+indexPath.row
            groupPicViewController.title = self.fantasticCount[selectRow] as? String
            
            self.navigationController?.pushViewController(groupPicViewController, animated: true)
            
        }else{
            
            let picViewController: PictureCollectionViewController!
        
            picViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PicCollection") as! PictureCollectionViewController
           
            let selectRow = indexPath.section*2+indexPath.row
            
            picViewController.title = self.fantasticCount[selectRow] as? String
            picViewController.typeName = self.fantasticCount[selectRow] as? String
            
            self.navigationController?.pushViewController(picViewController, animated: true)

        }
    }
    

    
  /*  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "showPicture"){
            
            let cell = sender as! FantasticViewCell
            let indexPath = self.collectionView!.indexPathForCell(cell)
            
            
            let picViewController = segue.destinationViewController as! PictureCollectionViewController
            //let selectRow = self.collectionView.indexPathForSelectedRow?.row
            //let indexPaths = self.collectionView!.indexPathsForVisibleItems() as [NSIndexPath]
            //let indexPath = indexPaths[0]
            let selectRow = indexPath!.section*2+indexPath!.row
            
            picViewController.title = self.fantasticCount[selectRow] as? String
            picViewController.typeName = self.fantasticCount[selectRow] as? String
            
            //teamDetaiViewController.title = team.TeamName as! String
        }
    }*/

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
