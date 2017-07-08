//
//  DBHelper.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/16.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import Foundation

struct DBHelper {
    
    static var db:COpaquePointer=nil
    
    static func applicationDocumentsDirectoryFile(fileName:NSString)->[CChar]?{
        
        let documentDirectory:NSArray=NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path=documentDirectory[0].stringByAppendingPathComponent(fileName as String) as String
        NSLog("path:%@", path)
        
        let cpath=path.cStringUsingEncoding(NSUTF8StringEncoding)
        
        return cpath
    }
    
    static func initDB() throws {
        
        let configTablePath=NSBundle.mainBundle().pathForResource("DBConfig", ofType: "plist")!
        NSLog("configTablePath=%@", configTablePath)
        
        let configTable=NSDictionary(contentsOfFile: configTablePath)
        
        var dbConfigVersion=configTable?.objectForKey("DB_VERSION") as! NSNumber?
        
        if(dbConfigVersion==nil){
            dbConfigVersion=NSNumber(integer: 0)
        }
        
        var versionNumber=DBHelper.dbVersionNumber()
        NSLog("%d",versionNumber)
        
        if(dbConfigVersion?.integerValue != versionNumber){
            
            let dbFilePath=DBHelper.applicationDocumentsDirectoryFile("NokiaFootball.db")
            if(sqlite3_open(dbFilePath!,&db)==SQLITE_OK){
                
                NSLog("数据库升级...")
                let createtablePath=NSBundle.mainBundle().pathForResource("create_info", ofType: "sql")!
                //let sql=NSString(contentsOfFile: createtablePath, usedEncoding: NSUTF8StringEncoding)
                let sql = try(NSString(contentsOfFile: createtablePath, encoding: NSUTF8StringEncoding))
                
                let cSql=sql.cStringUsingEncoding(NSUTF8StringEncoding)
                
                sqlite3_exec(db, cSql, nil, nil, nil)
                
                let usql=NSString(format: "update DBVersionInfo set version_number=%i", dbConfigVersion!.integerValue)
                let cusql=usql.cStringUsingEncoding(NSUTF8StringEncoding)
                sqlite3_exec(db, cusql, nil, nil,nil)
                
                sqlite3_close(db)
            }else{
                NSLog("Error:%s",sqlite3_errmsg(db));

            }
            
            
        }
    }
    
    
    

    static func dbVersionNumber()->Int{
        
        var versionNumber = -1
        
        let dbFilePath=DBHelper.applicationDocumentsDirectoryFile("NokiaFootball.db")
        
        if(sqlite3_open(dbFilePath!,&db) == SQLITE_OK){
            //NSLog("successful")
            let sql="create table if not exists DBVersionInfo(version_number int)"
            let cSql=sql.cStringUsingEncoding(NSUTF8StringEncoding)
            
            sqlite3_exec(db, cSql!, nil, nil, nil)
            
            let qsql="select version_number from DBVersionInfo"
            let cqSql=qsql.cStringUsingEncoding(NSUTF8StringEncoding)
            var statement:COpaquePointer = nil
            //NSLog("successful")
            if(sqlite3_prepare_v2(db, cqSql!, -1, &statement, nil) == SQLITE_OK){
                NSLog("successful")
                if(sqlite3_step(statement) == SQLITE_ROW){
                    NSLog("New version number!")
                    versionNumber=Int(sqlite3_column_int(statement, 0))
                }else{
                    NSLog("No new situation")
                    let insertSql="insert into DBVersionInfo(version_number)values(-1)"
                    let cInsertSql=insertSql.cStringUsingEncoding(NSUTF8StringEncoding)
                    sqlite3_exec(db, cInsertSql!, nil, nil, nil)
                }
            }else{
                //NSAssertionHandler("Error:%s",sqlite3_errmsg(db))
               // NSAssert(0,"Error:%s",sqlite3_errmsg(db));
                NSLog("%s",sqlite3_errmsg(db));
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
        }
        
        return versionNumber
        
    }


}