//
//  GroupCompetionViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/28.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import UIKit

class GroupCompetionViewController: UIViewController {
    
    var imageView:UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width:self.view.frame.width, height:self.view.frame.height))
        self.imageView.image = UIImage(named: "赛程表")
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.view.addSubview(imageView)

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
