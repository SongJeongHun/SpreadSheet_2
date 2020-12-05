//
//  SpreaSheetViewController.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import UIKit

class SpreadSheetViewController: UIViewController,UICollectionViewDataSource {
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var sheetName:UIButton!
    var buttonTop:UIButton = UIButton()
    var buttonBottom:UIButton = UIButton()
    var selectedCell:[IndexPath] = []
    var layout = SheetCustomLayout()
    @IBAction func modifySheetName(_ sender:UIButton!){
        let alert = UIAlertController(title: "알림", message: "시트 이름 변경", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let ok = UIAlertAction(title: "확인", style: .default, handler: {ok in
            guard let valStr = alert.textFields?[0].text else { return }
            self.layout.sheetVM.sheet[self.layout.sheetVM.currentIndex].sheetName = valStr
            //Struct = 복사 -> 대입
            //Class = 참조
            //값 넘어가는거 수정
            sender.setTitle(valStr, for: .normal)
            NotificationCenter.default.post(name: SpreadSheetViewController.modifyFinished, object: nil)
            self.collectionView.reloadData()
        })
        let cancel = UIAlertAction(title: "취소", style: .default, handler:nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layout
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return layout.sheetVM.sheet[layout.sheetVM.currentIndex].colums
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return layout.sheetVM.sheet[layout.sheetVM.currentIndex].rows
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
extension SpreadSheetViewController{
    //Notification 정의
    static let modifyFinished = Notification.Name(rawValue: "modifyFinished")
}
class spreadSheetCell:UICollectionViewCell{
    @IBOutlet weak var text:UILabel!
}

