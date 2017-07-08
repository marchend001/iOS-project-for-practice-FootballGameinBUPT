//
//  CompetitionBL.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/19.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import Foundation

class CompetitionBL:NSObject {
    
    func findAllData() -> NSMutableDictionary{
        
        var competiondao = CompetitionDao.sharedInstance
        var competions = competiondao.findAll()
        
        var resDict = NSMutableDictionary()
        
        for item in competions{
            
            var competion = item as! Competion
            
            let allKey = resDict.allKeys as NSArray
            
            if (allKey.containsObject(competion.CompetionDate!)){
                
                var value = resDict.objectForKey(competion.CompetionDate!) as! NSMutableArray
                value.addObject(competion)
                
            }else{
                var value = NSMutableArray()
                value.addObject(competion)
                resDict.setObject(value, forKey: competion.CompetionDate!)
            }
        }
        
        return resDict
    }
    
    func findTypeData(competionType:NSString) -> NSMutableArray{
        
        var competiondao = CompetitionDao.sharedInstance
        
        var list = competiondao.findByType(competionType)
        //var resDict = NSMutableDictionary()
        
        return list
    }

    
    //var dao = CompetitionDao.sharedInstance
}