//
//  showMemoController.swift
//  LunaMemoApp
//
//  Created by t2023-m0050 on 2023/08/02.
//

import UIKit

class showMemoController: UIViewController {
    
    var memo: Memo?
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Memo content:", memo?.content)
        print("Memo date:", memo?.date)
        // Do any additional setup after loading the view.
    }
    
}

extension showMemoController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //몇번째 셀
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memo", for: indexPath)
            
            cell.textLabel?.text = memo?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath)
            
            cell.textLabel?.text = formatter.string(for: memo?.date)
            return cell
        default :
            fatalError()
        }
    }
}
