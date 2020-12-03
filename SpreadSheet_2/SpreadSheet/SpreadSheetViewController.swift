//
//  SpreaSheetViewController.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import UIKit

class SpreadSheetViewController: UIViewController,UICollectionViewDataSource {
    var collectionView:UICollectionView!
    var sheet:SheetModel!
    var layout = SheetCustomLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        layout.sheet = sheet
        if (sheet.layoutStandard.count == 0){
            layout.clVM.initStandard()
        }
        layout.clVM = sheetViewModel(sheet: sheet)
        collectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0,y: 0), size: layout.attributeKit.contentSize), collectionViewLayout: layout)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sheet.colums
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sheet.rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}

