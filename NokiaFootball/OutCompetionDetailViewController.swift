//
//  OutCompetionDetailViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 17/1/10.
//  Copyright © 2017年 龚茜. All rights reserved.
//

import UIKit

class OutCompetionDetailViewController: UIViewController {
    
    var competion: Competion!
    
    var scrollView: UIScrollView = UIScrollView()
    var imageView: UIImageView = UIImageView()
    var competionInfo: UITextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView=UIScrollView(frame: CGRect(origin: CGPoint(x:0,y: 0), size: CGSize(width: self.view.frame.width, height: self.view.frame.height)))
        self.scrollView.center = self.view.center
        self.scrollView.contentSize = CGSize(width: self.view.frame.width,height: 1000)
        
        self.imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width:self.view.frame.width, height: 200))
        self.imageView.image = UIImage(named: competion.ImageInfo as! String)
        
        self.competionInfo.frame = CGRect(origin: CGPoint(x: 0, y: 200), size: CGSize(width:self.view.frame.width, height: 800))
        self.competionInfo.text = competion.CompetionInfo as! String
        
        self.scrollView.addSubview(imageView)
        self.scrollView.addSubview(competionInfo)
        
        self.view.addSubview(scrollView)


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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
