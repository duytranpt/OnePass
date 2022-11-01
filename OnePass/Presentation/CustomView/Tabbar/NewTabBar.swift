//
//  NewTabBar.swift
//  OnePass
//
//  Created by Duy Tran on 21/10/2022.
//

import UIKit

class NewTabBar: UITabBarController {

    var currentIndex = 0
    var bottomStack: UIStackView!
    var tabbarView: TabbarView!
    var addbutton: OPButton!
    
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
        delegate = self
        tabBar.isHidden = true
        self.setupUI()
        self.setupTabs()
        
        let stb = UIStoryboard(name: "OPPopupVC", bundle: Bundle.main)
        let vc = stb.instantiateViewController(withIdentifier: "OPPopupVC") as! OPPopupVC
        
        let stb2 = UIStoryboard(name: "HomeVC", bundle:Bundle.main)
        let vc2 = stb2.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let stb3 = UIStoryboard(name: "Main", bundle:Bundle.main)
        let vc3 = stb3.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        
        viewControllers = [vc2, vc, vc3]
    }

    func setupUI() {
        
        tabbarView = TabbarView(frame: .zero)
        tabbarView.backgroundColor = .clear
        tabbarView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabbarView)
        tabbarView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        tabbarView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        tabbarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15).isActive = true
        tabbarView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        bottomStack = UIStackView(frame: .zero)
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        self.tabbarView.addSubview(bottomStack)
        
        bottomStack.leftAnchor.constraint(equalTo: self.tabbarView.leftAnchor, constant: 10).isActive = true
        bottomStack.rightAnchor.constraint(equalTo: self.tabbarView.rightAnchor, constant: -86).isActive = true
        bottomStack.bottomAnchor.constraint(equalTo: self.tabbarView.bottomAnchor).isActive = true
        bottomStack.topAnchor.constraint(equalTo: self.tabbarView.topAnchor).isActive = true
        bottomStack.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        addbutton = OPButton(frame: .zero)
        addbutton.setupBtnPlus()
        addbutton.cornerRadius = 33
        addbutton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addbutton)
        addbutton.rightAnchor.constraint(equalTo: self.tabbarView.rightAnchor).isActive = true
        addbutton.bottomAnchor.constraint(equalTo: self.tabbarView.bottomAnchor, constant: -20).isActive = true
        addbutton.widthAnchor.constraint(equalToConstant: 66).isActive = true
        addbutton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
        addbutton.addAction {
            print("0000")
            let stb = UIStoryboard(name: "OPPopupVC", bundle: Bundle.main)
            let vc = stb.instantiateViewController(withIdentifier: "OPPopupVC") as! OPPopupVC
            vc.modalPresentationStyle = .formSheet
            vc.isModalInPresentation  = true

            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    sheet.detents = [.medium(), .large()]
                    sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                    sheet.preferredCornerRadius = 20
                }
            }

            self.present(vc, animated: true)
        }
        
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
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
        print("selected: \(self.selectedIndex) ")
        
    }
}

extension NewTabBar: StackItemViewDelegate {
    func handleTap(_ view: StackItemView) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: { $0 === view }) ?? 0
        print(currentIndex)
        changeTab(tab: currentIndex)
    }
    
}

extension NewTabBar: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

            guard let fromView = selectedViewController?.view, let toView = viewController.view else {
              return false // Make sure you want this as false
            }

            if fromView != toView {
              UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.curveEaseIn], completion: nil)
            }

            return true
        }
    
}
