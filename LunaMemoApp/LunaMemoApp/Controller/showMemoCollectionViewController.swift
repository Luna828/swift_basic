import UIKit

class showMemoCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 각 콜렉션뷰 쎌 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! memoClass
        
        cell.label.text = DataManager.shared.memoList[indexPath.row].content
        
        return cell
    }
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("안녕")
        //collectionview 설정
        //myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //table view 목록 업데이트
        DataManager.shared.fetchMemo()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(DataManager.shared.memoList.count)
        
        return DataManager.shared.memoList.count
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? memoClass else {
                return UICollectionViewCell()
            }
            
            cell.label?.text = "안녕"
            
            return cell
        }
    }
}


class memoClass: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
}
