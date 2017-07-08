//
//  TeamDetailViewController.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/22.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    var team:FootballTeam!
    
    var scrollView:UIScrollView = UIScrollView()
    var imageView:UIImageView = UIImageView()
    var teamInfo:UITextView = UITextView()
    var teamName:UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView=UIScrollView(frame: CGRect(origin: CGPoint(x:0,y: 0), size: CGSize(width: self.view.frame.width, height: self.view.frame.height)))
        self.scrollView.center = self.view.center
        self.scrollView.contentSize = CGSize(width: self.view.frame.width,height: 1000)
        
        self.imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width:self.view.frame.width, height: 200))
        self.imageView.image = UIImage(named: team.TeamName as! String)
        
        self.teamInfo.frame = CGRect(origin: CGPoint(x: 0, y: 200), size: CGSize(width:self.view.frame.width, height: 800))
        self.teamInfo.text = team.TeamInfo as! String
        
        self.scrollView.addSubview(imageView)
        self.scrollView.addSubview(teamInfo)
        
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
