//
//  SheetVIewModel.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import Foundation
extension ListViewModel{
    func initStandard(){
        var section:[CellModel] = []
        sheet[currentIndex].layoutStandard = []
        for _ in 0..<sheet[currentIndex].rows{
            for _ in 0..<sheet[currentIndex].colums{
                let cell = CellModel()
                section.append(cell)
            }
            sheet[currentIndex].layoutStandard.append(section)
        }
    }
    func alterSheetName(name:String){
        self.sheet[currentIndex].sheetName = name
    }
}
