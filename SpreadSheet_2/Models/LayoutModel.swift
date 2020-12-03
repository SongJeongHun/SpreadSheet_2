//
//  LayoutModel.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//
import UIKit
struct loginModel{
    let id:String
    let name:String
    let pwd:String
    init(id:String,name:String,pwd:String){
        self.id = id
        self.name = name
        self.pwd = pwd
    }
}
struct CellModel{
    var cellType:String
    var width:Int
    var height:Int
    init(){
        width = 100
        height = 25
        cellType = "Text"
    }
    mutating func alterType(string:String){
        switch string {
        case "Text":
            self.cellType = "Text"
        case "URL":
            self.cellType = "URL"
        case "Image":
            self.cellType = "Image"
        default:
            self.cellType = "Text"
        }
    }
}
struct SheetModel{
    let sheetID:Int
    var sheetName:String = "제목 없는 스프레드 시트"
    let initTime:String
    let writer:String
    var colums:Int
    var rows:Int
    var layoutStandard:[[CellModel]] = []
    init(initTime:String,writer:String,sheetId:Int){
        self.sheetID = sheetId
        self.initTime = initTime
        self.writer = "송정훈"
        self.colums = 8
        self.rows = 100 + 1
    }
}
