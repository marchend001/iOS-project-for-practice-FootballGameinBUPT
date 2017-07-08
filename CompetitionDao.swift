//
//  CompetitionDao.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/16.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import Foundation

class CompetitionDao:BaseDao {
    
    
    class var sharedInstance:CompetitionDao{
        
        struct Static {
            static var instance:CompetitionDao?
            static var token:dispatch_once_t=0
        }
        
        dispatch_once(&Static.token){
            Static.instance=CompetitionDao()
            
        }
        return Static.instance!
    }
    
    
    func findAll() -> NSMutableArray{
        var listData = NSMutableArray()
        
        if(self.openDB()){
            
            let qsql = "SELECT CompetionID,ComprtionType,CompetionInfo FROM Competion"
            let cqsql = qsql.cStringUsingEncoding(NSUTF8StringEncoding)
            
            var statement:COpaquePointer = nil
            
            if(sqlite3_prepare_v2(db, cqsql!, -1, &statement, nil) == SQLITE_OK){
                
                while(sqlite3_step(statement) == SQLITE_ROW){
                    
                    var competion=Competion()
                    var teamOne=FootballTeam()
                    var teamTwo=FootballTeam()
                    
                    //var cTeamID = UnsafePointer<Int8>(sqlite3_column_text(statement, 0))
                    competion.CompetionID=Int(sqlite3_column_int(statement, 0))
                    
                    var cCompetionType = UnsafePointer<Int8>(sqlite3_column_text(statement, 1))
                    competion.CompetionType=String.fromCString(cCompetionType)
                    
                    var cCompetionInfo = UnsafePointer<Int8>(sqlite3_column_text(statement, 2))
                    competion.CompetionInfo=String.fromCString(cCompetionInfo)
                    
                    listData.addObject(competion)
                    
                }
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
            
            
        }
        return listData
    }
    
    func findByType(competionType:NSString) -> NSMutableArray{
        var listData = NSMutableArray()
        
        if(self.openDB()){
            
            let qsql = "SELECT CompetionID,CompetionType,CompetionPk,ImageInfo,CompetionInfo,CompetionDate FROM Competion Where CompetionType=?"
            let cqsql = qsql.cStringUsingEncoding(NSUTF8StringEncoding)
            
            var statement:COpaquePointer = nil
            
            if(sqlite3_prepare_v2(db, cqsql!, -1, &statement, nil) == SQLITE_OK){
                sqlite3_bind_text(statement, 1, competionType.cStringUsingEncoding(NSUTF8StringEncoding), -1, nil)
                
                
                while(sqlite3_step(statement) == SQLITE_ROW){
                    
                    var competion=Competion()
                    //var teamOne=FootballTeam()
                   // var teamTwo=FootballTeam()
                    
                    //var cTeamID = UnsafePointer<Int8>(sqlite3_column_text(statement, 0))
                    competion.CompetionID=Int(sqlite3_column_int(statement, 0))
                    
                    var cCompetionType = UnsafePointer<Int8>(sqlite3_column_text(statement, 1))
                    competion.CompetionType=String.fromCString(cCompetionType)
                    
                    var cCompetionPk = UnsafePointer<Int8>(sqlite3_column_text(statement, 2))
                    competion.CompetionPk=String.fromCString(cCompetionPk)
                    
                    var cImageInfo = UnsafePointer<Int8>(sqlite3_column_text(statement, 3))
                    competion.ImageInfo=String.fromCString(cImageInfo)
                    
                    var cCompetionInfo = UnsafePointer<Int8>(sqlite3_column_text(statement, 4))
                    competion.CompetionInfo=String.fromCString(cCompetionInfo)
                    
                    var cCompetionDate = UnsafePointer<Int8>(sqlite3_column_text(statement, 5))
                   // var sCompetionDate = String.fromCString(cCompetionDate)
                   
                    competion.CompetionDate=String.fromCString(cCompetionDate)
                    
                    listData.addObject(competion)
                    
                }
            }else{
                NSLog("Error:%s",sqlite3_errmsg(db))
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
            
            
        }
        return listData

        
    }

}
