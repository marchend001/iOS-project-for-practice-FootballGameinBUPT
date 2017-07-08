//
//  PicDetailViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 17/1/11.
//  Copyright © 2017年 龚茜. All rights reserved.
//

import UIKit

class PicDetailViewController: UIViewController {
    
    var  imageName: String?
    var imageView: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width:self.view.frame.width, height:220))
        self.imageView.center = self.view.center
        self.imageView.image = UIImage(named:imageName!)
        
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
