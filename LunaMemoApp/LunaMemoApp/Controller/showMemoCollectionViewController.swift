import UIKit

class showMemoCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("안녕")
        //collectionview 설정
        //myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
//        self.myCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        if let flowlayout = myCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//        flowlayout.estimatedItemSize = .zero
//        }
        myCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //table view 목록 업데이트
        DataManager.shared.fetchMemo()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     
        return sectionInsets
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.bounds.width
//        let height = collectionView.bounds.height
//        let itemsPerRow: CGFloat = 2
////        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
////        let itemsPerColumn: CGFloat = 3
////        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
////        let cellWidth = (width - widthPadding) / itemsPerRow
////        let cellHeight = (height - heightPadding) / itemsPerColumn
//
//        let cellWidth: CGFloat = (width - 20 - itemsPerRow * 2) / 3
//        let cellHeight: CGFloat = 50
//        //화면 가로 사이즈 구하기
//        // cell 3개
//        // 셀이랑 셀 사이 거리
//        //가로사이즈 - 셀 사이 거리 * 2 를 빼고 / 3
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
    
    // 각 콜렉션뷰 쎌 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! memoClass
        
        cell.collectionBtn.setTitle(DataManager.shared.memoList[indexPath.row].content, for: .normal)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(DataManager.shared.memoList.count)
        
        return DataManager.shared.memoList.count
    }
}

extension showMemoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 3
        // print(width)
        let height = width * 1.2
    return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


class memoClass: UICollectionViewCell {
    @IBOutlet weak var collectionBtn: UIButton!
}
