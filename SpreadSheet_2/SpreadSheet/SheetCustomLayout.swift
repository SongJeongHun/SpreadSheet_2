//
//  SheetCustomLayout.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import UIKit
class SheetCustomLayout:UICollectionViewLayout{
    var sheet:SheetModel!
    var attributeKit = SheetAttributeKit()
    var clVM :sheetViewModel!
    override var collectionViewContentSize:CGSize{
        return attributeKit.contentSize
    }
    override func prepare() {
        guard let collectionView = collectionView else {return}
        if attributeKit.layoutAttributes.count != collectionView.numberOfSections{
            createCell(collectionView: collectionView)
            return
        }
        fixHeader(at: collectionView,forElement: attributeKit.sectionAttribute)
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeKit.sectionAttribute
    }
    
}
extension SheetCustomLayout{
    func createCell(collectionView:UICollectionView){
        let standard = clVM.readSheet()
        var x = attributeKit.contentOffx
        var y = attributeKit.contentOffy
        for section in attributeKit.pointerSection..<collectionView.numberOfSections{
            for item in attributeKit.pointerItem..<sheet.colums{
                
            }
        }
        
    }
    func fixHeader(at collectionView:UICollectionView,forElement : [UICollectionViewLayoutAttributes]){
        
    }
    func addCol(collectionView:UICollectionView){
        
    }

}
struct SheetAttributeKit{
    var contentOffx:Int
    var contentOffy:Int
    var contentSize:CGSize
    var pointerSection :Int
    var pointerItem : Int
    var sectionAttribute:[UICollectionViewLayoutAttributes]
    var layoutAttributes:[[UICollectionViewLayoutAttributes]]
    init() {
        contentOffx = 0
        contentOffy = 0
        contentSize = .zero
        pointerSection = 0
        pointerItem = 0
        sectionAttribute = []
        layoutAttributes = []
    }
}
