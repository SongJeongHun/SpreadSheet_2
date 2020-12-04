//
//  SpreaSheetViewController.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import UIKit

class SpreadSheetViewController: UIViewController,UICollectionViewDataSource {
    @IBOutlet weak var collectionView:UICollectionView!
    var buttonTop:UIButton = UIButton()
    var buttonBottom:UIButton = UIButton()
    var selectedCell:[IndexPath] = []
    var layout = SheetCustomLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layout
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return layout.sheetVM.sheet.colums
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return layout.sheetVM.sheet.rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellForItem(self.collectionView,indexPath)
    }
}
extension SpreadSheetViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedCell.contains(indexPath){
            return inactiveCell(self.collectionView,indexPath)
        }else{
            return activeCell(self.collectionView,indexPath)
        }
    }
}
class spreadSheetCell:UICollectionViewCell{
    @IBOutlet weak var text:UILabel!
}

