//
//  SheetVIewModel.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import Foundation
class sheetViewModel{
    var sheet:SheetModel
    init(sheet:inout SheetModel){
        print(sheet)
        self.sheet = sheet
        print(self.sheet)
    }
    func initStandard(){
        var section:[CellModel] = []
        sheet.layoutStandard = []
        for _ in 0..<sheet.rows{
            for _ in 0..<sheet.colums{
                let cell = CellModel()
                section.append(cell)
            }
            sheet.layoutStandard.append(section)
        }
    }
    func alterSheetName(name:String){
        self.sheet.sheetName = name
    }
    func readSheet() -> [CellModel]{
        var newArray:[CellModel] = []
        for section in 0..<sheet.layoutStandard.count{
            for item in sheet.layoutStandard[section]{
                newArray.append(item)
            }
        }
        return newArray
    }
}
