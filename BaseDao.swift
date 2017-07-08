//
//  BaseDao.swift
//  NokiaFootball
//
//  Created by 龚茜 on 16/12/16.
//  Copyright © 2016年 龚茜. All rights reserved.
//

import Foundation


//let DB_FILE_NAME = "app.db"

let dbFilePath = DBHelper.applicationDocumentsDirectoryFile("NokiaFootball.db")!

class BaseDao:NSObject{
    
    var db:COpaquePointer = nil
    
    override init() {
        do{
        try DBHelper.initDB()
            
        }catch{
            
        }
    }
    
    func openDB()->Bool{
        if(sqlite3_open(dbFilePath,&db) != SQLITE_OK){
            sqlite3_close(db)
            NSLog("Fail in opening database!")
            return false
        }
        return true
    }
}