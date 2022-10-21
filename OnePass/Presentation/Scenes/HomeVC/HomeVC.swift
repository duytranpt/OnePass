//
//  HomeVC.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tabbarView: TabbarView!
    @IBOutlet weak var bottomStack: UIStackView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    var currentIndex = 0
    
    lazy var tabs: [StackItemView] = {
        var items = [StackItemView]()
        for _ in 0..<3 {
            items.append(StackItemView.newInstance)
        }
        return items
    }()
    
    lazy var tabModels: [BottomStackItem] = {
        return [
            BottomStackItem(title: "Home", image: "home"),
            BottomStackItem(title: "Like", image: "heart"),
            BottomStackItem(title: "Profile", image: "user")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.roundCorners(radius: 20, corners: .allCorners)
        mainView.roundCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
        
        self.setupTabs()
                
    }
    
    func setupTabs() {
        for (index, model) in self.tabModels.enumerated() {
            let tabView = self.tabs[index]
            model.isSelected = index == 0
            tabView.item = model
            tabView.delegate = self
            self.bottomStack.addArrangedSubview(tabView)
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        let stb = UIStoryboard(name: "OPPopupVC", bundle: Bundle.main)
        let vc = stb.instantiateViewController(withIdentifier: "OPPopupVC") as! OPPopupVC
        if #available(iOS 15.0, *) {
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.preferredCornerRadius = 20
            }
        }
        
        self.navigationController?.present(vc, animated: true)
    }
}

extension HomeVC: StackItemViewDelegate {
    
    func handleTap(_ view: StackItemView) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: { $0 === view }) ?? 0
    }
    
}
