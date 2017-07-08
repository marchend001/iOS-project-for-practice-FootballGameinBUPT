//
//  TeamDao.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/16.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import Foundation

class TeamDao:BaseDao{
    
    class var sharedInstance:TeamDao{
        
        struct Static {
            static var instance:TeamDao?
            static var token:dispatch_once_t=0
        }
        
        dispatch_once(&Static.token){
            Static.instance=TeamDao()
            
        }
        return Static.instance!
    }
    
    func findAll() -> NSMutableArray{
        
        var listData = NSMutableArray()
        
        if(self.openDB()){
            
            let qsql = "SELECT TeamID,TeamName,TeamInfo FROM FootballTeam"
            let cqsql = qsql.cStringUsingEncoding(NSUTF8StringEncoding)
            
            var statement:COpaquePointer = nil
            
            if(sqlite3_prepare_v2(db, cqsql!, -1, &statement, nil) == SQLITE_OK){
                
                while(sqlite3_step(statement) == SQLITE_ROW){
                    
                    var team=FootballTeam()
                    
                    //var cTeamID = UnsafePointer<Int8>(sqlite3_column_text(statement, 0))
                    team.TeamID=Int(sqlite3_column_int(statement, 0))
                    
                    var cTeamName = UnsafePointer<Int8>(sqlite3_column_text(statement, 1))
                    team.TeamName=String.fromCString(cTeamName)
                    
                    var cTeamInfo = UnsafePointer<Int8>(sqlite3_column_text(statement, 2))
                    team.TeamInfo=String.fromCString(cTeamInfo)
                    
                    listData.addObject(team)
                
                }
            }else{
                NSLog("Error:%s",sqlite3_errmsg(db))
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
            
            
        }
        return listData
    }
    
    
    func findByGroup() -> NSMutableArray{
        
        var listData = NSMutableArray()
        
        
        return listData
    }
    
    
    func findByType() -> NSMutableArray{
        
        var listData = NSMutableArray()
        if(self.openDB()){
            
            let qsql = "SELECT CompetionDate,CompetionInfo FROM Competion where CompetionType = ?"
            let cqsql = qsql.cStringUsingEncoding(NSUTF8StringEncoding)
            
            var statement:COpaquePointer = nil
            
            if(sqlite3_prepare_v2(db, cqsql!, -1, &statement, nil) == SQLITE_OK){
                let dateFormatter:NSDateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let type = "OutPk"
                sqlite3_bind_text(statement, 1, type, -1, nil)
                
                while(sqlite3_step(statement) == SQLITE_ROW){
                    
                    var competion=Competion()
                    
                    //var cTeamID = UnsafePointer<Int8>(sqlite3_column_text(statement, 0))
                    //competion.CompetionDate
                    let bufDate = UnsafePointer<Int8>(sqlite3_column_text(statement, 0))
                    let strDate = String.fromCString(bufDate)!
                    competion.CompetionDate = strDate
                    
                    var cInfo = UnsafePointer<Int8>(sqlite3_column_text(statement, 1))
                    competion.CompetionInfo=String.fromCString(cInfo)
                    

                    
                    listData.addObject(competion)
                    
                }
                NSLog("%d",listData.count)
            }else{
                NSLog("Error:%s",sqlite3_errmsg(db))
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
            
            
        }
        return listData
    }
}