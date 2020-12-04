//
//  SheetCustomLayout.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import UIKit
class SheetCustomLayout:UICollectionViewLayout{
    var attributeKit = SheetAttributeKit()
    var sheetVM:sheetViewModel!
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
        let standard = sheetVM.sheet.layoutStandard
        var x = attributeKit.contentOffx
        var y = attributeKit.contentOffy
        var contentwidth:CGFloat = 0
        var attribute:[UICollectionViewLayoutAttributes]
        for section in attributeKit.pointerSection..<collectionView.numberOfSections{
            attribute = []
            for item in attributeKit.pointerItem..<sheetVM.sheet.colums{
                let indexPath = IndexPath(item: item, section: section)
                let layout = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                let cell = standard[section][item]
                layout.frame = CGRect(x: x, y: y, width: cell.width, height: cell.height)
                attribute.append(layout)
                attributeKit.sectionAttribute.append(layout)
                x +=  cell.width
                if x / cell.width ==  sheetVM.sheet.colums {
                    contentwidth = CGFloat(x)
                    x = 0
                    y += cell.height
                }
            }
            attributeKit.layoutAttributes.append(attribute)
        }
        if let layout = attributeKit.layoutAttributes.last?.last {
            attributeKit.contentSize = CGSize(width: CGFloat(contentwidth), height: layout.frame.maxY)
        }
        setContentOff(x: x, y: y)
    }
    func fixHeader(at collectionView:UICollectionView,forElement : [UICollectionViewLayoutAttributes]){
        for section in 0..<collectionView.numberOfSections{
            for index in 0..<sheetVM.sheet.colums{
                let layouts = forElement
                let indexs = sheetVM.sheet.colums * section
                //0열 고정
                var frame = layouts[indexs].frame
                frame.origin.x = collectionView.contentOffset.x
                layouts[indexs].frame = frame
                layouts[indexs].zIndex = 100
                //0행 고정
                var layout = layouts[index]
                frame = layout.frame
                frame.origin.y = collectionView.contentOffset.y
                layout.frame = frame
                layout.zIndex = 100
                //(0,0)고정
                layout = layouts[0]
                frame = layout.frame
                frame.origin = CGPoint(x: collectionView.contentOffset.x,y: collectionView.contentOffset.y)
                layout.frame = frame
                layout.zIndex = 101
            }
        }
    }
    func addCol(collectionView:UICollectionView){
        
    }
    func setContentOff(x:Int,y:Int){
        attributeKit.contentOffx = x
        attributeKit.contentOffy = y
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

