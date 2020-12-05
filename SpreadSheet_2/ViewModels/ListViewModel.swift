//
//  ListViewModel.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//
import Foundation
class ListViewModel{
    var sheet:[SheetModel]
    var currentIndex:Int = 0
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.timeStyle = .long
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    init(){
        self.sheet = [SheetModel(initTime: "2020-12-01", writer: "송정훈", sheetId: 0),SheetModel(initTime: "2020-12-02", writer: "송정훈", sheetId: 1)]
    }
    func addSheet(name:String){
        let initDate = formatter.string(for: Date())!
        let newElement:SheetModel = SheetModel(initTime: initDate, writer: name, sheetId: sheet.count)
        sheet.append(newElement)
    }
    func deleteSheet(index:IndexPath){
        sheet.remove(at: index.row)
    }
   
}
