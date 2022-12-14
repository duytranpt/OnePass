//
//  YourPassVC.swift
//  OnePass
//
//  Created by Duy Tran on 01/11/2022.
//

import UIKit
import BisKit

class YourPassVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataModelPass = UserDefaults.getPassModel(userSessionKey: "Pass")
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionFooterHeight = 12
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "OPCell", bundle: .main), forCellReuseIdentifier: "OPCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataModelPass = UserDefaults.getPassModel(userSessionKey: "Pass")
        tableView.reloadData()
    }

    @IBAction func getData(_ sender: Any) {
        UserDefaults.clearPassModel(userSessionKey: "Pass")
        dataModelPass = UserDefaults.getPassModel(userSessionKey: "Pass")
        tableView.reloadData()
    }
    

}

extension YourPassVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModelPass!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OPCell", for: indexPath) as! OPCell
        cell.showPass.isHidden = true
        cell.fillData(data: dataModelPass![indexPath.section])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OPCell
        UIPasteboard.general.string = cell.passWord.text
        
        let label = ToppingLabel(text: "Đã sao chép password")
        let biscuit = BiscuitViewController(title: (cell.displayName.text ?? ""), timeout: 1.5)
        self.present(biscuit, animated: true, completion: nil)
    }
    
}
