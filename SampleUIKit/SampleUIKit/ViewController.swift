import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    let ProfileArray: [String] = [
        "Luna Kim",
        //"Emily Kim"
    ]
    
    let sections = ["",""]
    
    let contentList = ["Wi-Fi","Bluetooth","셀룰러","개인용 핫스팟", "VPN"]
    
    //section의 개수 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //아주중요
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        print("ProfileArray. ")
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    //테이블뷰의 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return ProfileArray.count
        } else if section == 1 {
            return contentList.count
        }
        return 1
    }
    
    // 각 쎌에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            //profile 셀 등록
            settingTableView.register(UINib(nibName: "TableViewNameCell", bundle: nil), forCellReuseIdentifier: "TableViewNameCell")
            settingTableView.rowHeight = UITableView.automaticDimension
            settingTableView.estimatedRowHeight = 120
            
            let cell = settingTableView.dequeueReusableCell(withIdentifier: "TableViewNameCell", for: indexPath) as! TableViewNameCell
            cell.profileImg.image = UIImage(systemName: "person")
            cell.userNameLabel.text = ProfileArray[indexPath.item]
            
            return cell
        } else {
            settingTableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
            let cell = settingTableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
            
            cell.settingLabel.text = contentList[indexPath.item]
            return cell
        }
    }
}
