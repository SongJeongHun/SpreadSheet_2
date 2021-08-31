# SpreadSheet
 구글스프레드시트 클로 코딩 (2020.11.03 ~ 2021.12.05) 미완성

## 폴더구조
* SpreadSheet
  * SpreadSheet 뷰컨트롤러
  * CollectionView Custom Layout
* ViewModels
  * 뷰모델파일
* Model
  * 레아이웃 모델
* SpreadList
  * 리스트 뷰컨트롤러
  
  
# 프로젝트 설명
# 샐행화면
## 리스트뷰
![image](https://user-images.githubusercontent.com/73823603/131445495-c0f534d5-3a35-44a3-90c8-c034521d3454.png)   
•빈 시트를 생성할 수 있습니다.
## 시트 편집
![image](https://user-images.githubusercontent.com/73823603/131445526-a939845f-c3d0-4208-853f-339ef27f8d5a.png)
![image](https://user-images.githubusercontent.com/73823603/131445557-29841425-19b4-4af8-a4f7-7c2c05aadb54.png)
![image](https://user-images.githubusercontent.com/73823603/131445575-3b3ec982-5d64-403c-bbbf-e18b2cd0e7d7.png)  
•0행과 0열은 고정되어 맨위로 올라옵니다.  
•셀을 탭한후 버튼을 늘려 드래그 할 수 있습니다.  
•상단 시트이름을 변경할 있습니다.

# 주요기능 
## CollectionView Custom Layout
•이중 반복문을 활용하여 직접 속성을 만들어준다  
```swift
func createCell(collectionView:UICollectionView){
        let standard = sheetVM.currentSheet().layoutStandard
        var x = attributeKit.contentOffx
        var y = attributeKit.contentOffy
        var contentwidth:CGFloat = 0
        var attribute:[UICollectionViewLayoutAttributes]
        for section in attributeKit.pointerSection..<collectionView.numberOfSections{
            attribute = []
            for item in attributeKit.pointerItem..<sheetVM.currentSheet().colums{
                let indexPath = IndexPath(item: item, section: section)
                let layout = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                let cell = standard[section][item]
                layout.frame = CGRect(x: x, y: y, width: cell.width, height: cell.height)
                attribute.append(layout)
                attributeKit.sectionAttribute.append(layout)
                x +=  cell.width
                if x / cell.width ==  sheetVM.currentSheet().colums {
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
```
## Stichky Header
•프레임 위치를 고정시키고 zIndex를 활용하여 항상 맨위로 올라오게 만듬. 
•Layout 이 prepare 될때 호출.  
```swift
func fixHeader(at collectionView:UICollectionView,forElement : [UICollectionViewLayoutAttributes]){
        for section in 0..<collectionView.numberOfSections{
            for index in 0..<sheetVM.currentSheet().colums{
                let layouts = forElement
                let indexs = sheetVM.currentSheet().colums * section
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
```
# 아쉬운 점
## 디자인패턴
MVVM 디자인패턴을 적용하고자 했으나 정확하게 나뉘어지지않음
## 일시중단
앞으로 만들고자하는 기능의 난이도와 앱 아키텍처 학습을 위해 프로젝트를 일시중단함
