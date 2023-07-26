import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    let contentArray: [String] = [
        "Luna Kim",
        "Emily Kim"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //아주중요
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        print("contentArray. ")
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //테이블뷰의 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    
    
    // 각 쎌에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        settingTableView.register(UINib(nibName: "TableViewNameCell", bundle: nil), forCellReuseIdentifier: "TableViewNameCell")
        settingTableView.rowHeight = UITableView.automaticDimension
        settingTableView.estimatedRowHeight = 120
        guard let cell = settingTableView.dequeueReusableCell(withIdentifier: "TableViewNameCell", for: indexPath) as? TableViewNameCell else {
            return UITableViewCell()
        }
        cell.userNameLabel.text = contentArray[indexPath.item]
        return cell
    }
}
