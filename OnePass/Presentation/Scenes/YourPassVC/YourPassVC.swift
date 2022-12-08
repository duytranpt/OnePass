//
//  YourPassVC.swift
//  OnePass
//
//  Created by Duy Tran on 01/11/2022.
//

import UIKit
import BisKit

class YourPassVC: OPBaseVC {

    @IBOutlet weak var tableView: UITableView!
    let userSessionKey = "Pass"
    var dataModelPass = [PassModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setHeader(title: "Your password", subTitle: "keep all your passwords", Type: .ONE_LINE_SIMPLE)
        self.hideAllButton()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionFooterHeight = 12
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "OPCell", bundle: .main), forCellReuseIdentifier: "OPCell")
        print("1")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        dataModelPass = UserDefaults.getPassModel(userSessionKey: userSessionKey)!
        tableView.reloadData()
        
        dataModelPass.sort { $0.dateCreate! > $1.dateCreate! }
        print("2")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("3")
    }
    

    @IBAction func getData(_ sender: Any) {
        UserDefaults.clearPassModel(userSessionKey: userSessionKey)
        dataModelPass = [PassModel]()
//        dataModelPass = UserDefaults.getPassModel(userSessionKey: userSessionKey)!
        tableView.reloadData()
    }
    

}

extension YourPassVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModelPass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OPCell", for: indexPath) as! OPCell
        cell.showPass.isHidden = true
        cell.fillData(data: dataModelPass[indexPath.section])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OPCell
        UIPasteboard.general.string = cell.passWord.text
        
        self.showAlertHeader(title: "Copied \(cell.displayName!.text) password")
    }
    
}
