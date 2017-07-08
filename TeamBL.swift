
//  TeamBL.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/19.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import Foundation

class TeamBL:NSObject {
    
    func readData() -> NSMutableArray{
        
        var dao = TeamDao.sharedInstance
        var list = dao.findAll()
        
        return list
    }
    
    
    
    func findByType() -> NSMutableArray{
        
        var dao = TeamDao.sharedInstance
        var list = dao.findByType()
        
        return list
    }
}