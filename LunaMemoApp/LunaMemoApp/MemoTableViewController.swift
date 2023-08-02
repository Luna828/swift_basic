import UIKit


class MemoTableViewController: UITableViewController {
    
    @IBOutlet var memoTableView: UITableView!
    
    var index = 0
    
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //table view 목록 업데이트
        
        //tableView.reloadData()
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //observer 추가
        NotificationCenter.default.addObserver(forName: NewMemoController.newMemoInsert, object: nil, queue: OperationQueue.main, using: {[weak self] (noti) in self?.tableView.reloadData()})
    }
    
    func numberOxfSections(in tableView: UITableView) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "showMemo", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        memoTableView.register(UINib(nibName: "MemoCell", bundle: nil), forCellReuseIdentifier: "MemoCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoCell
        
        let memo = Memo.dummyMemoList[indexPath.row]
        
        cell.memoTitle?.text = memo.content
        cell.memoDate.text = formatter.string(for: memo
            .date)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let vc = segue.destination as? showMemoController {
                    vc.memo = Memo.dummyMemoList[index]
                }
    }
  
}
