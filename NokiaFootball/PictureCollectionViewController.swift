//
//  PictureCollectionViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/29.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PictureCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var typeName: String?
    var picName: String?
    var picCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        //let layout = self.collectionView?.layoutMargins
        //layout.minimumInteritemSpacing = 5
        //layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        
        if(typeName == "淘汰赛"){
            picName = "Out"
            picCount = 14
        }else if(typeName == "A组"){
            picName = "GroupPkA"
            picCount = 6
        }else if(typeName == "B组"){
            picName = "GroupPkB"
            picCount = 4
        }else if(typeName == "C组"){
            picName = "GroupPkC"
            picCount = 6
        }else if(typeName == "巅峰对决"){
            picName = "Top"
            picCount = 10
            
        }
        

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
        return picCount!/2
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! PictureViewCell
    
        let selectRow = indexPath.section*2+indexPath.row
        let name = String(format: "%@%d",picName!,selectRow)
        cell.imageView.image = UIImage(named: name)
        // Configure the cell
    
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "showPictureDetail"){
            
            let cell = sender as! PictureViewCell
            let indexPath = self.collectionView!.indexPathForCell(cell)
            let selectRow = indexPath!.section*2+indexPath!.row

            let picDetail = segue.destinationViewController as! PicDetailViewController
            picDetail.imageName = String(format: "%@%d",picName!,selectRow)
            
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

//extension PictureCollectionViewController:UICollectionViewDelegateFlowLayout{
    
    //func collectionView(_collectionView: UICollectionView,
      ////  layout collectionViewLayout: UICollectionViewLayout,
     //   insetForSectionAt section: Int) -> UIEdgeInsets{
   // return UIEdgeInsetsMake(0, 0, 0, 0)
    
   // }

    
//}
