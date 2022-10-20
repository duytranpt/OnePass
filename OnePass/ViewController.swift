//
//  ViewController.swift
//  OnePass
//
//  Created by Duy Tran on 19/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLbl: UILabel!
    @IBOutlet weak var nameApp: UITextField!
    @IBOutlet weak var showLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let changeBackground = UIMenuItem(title: "Tap Me", action: #selector(changeBackgroundColour))
        UIMenuController.shared.menuItems = [changeBackground]
        view.endEditing(true)
        
        displayLbl.font = OPFonts.fontBold(size: 30)

    }
    
    @objc func changeBackgroundColour() {
        self.view.backgroundColor = .cyan //just makes the background colour cyan
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+:?/><.[]{}~"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    @IBAction func genPass(_ sender: Any) {
        displayLbl.font = OPFonts.fontRegularItalic(size: 20)
        view.endEditing(true)
        showLbl.text = "Áp: \(nameApp.text!) \nMk: \(randomString(length: 20))"
    }
}

