//
//  TabNavigationMenu.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

class TabNavigationMenu: UIImageView {
    
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        
        print(frame)
        
//        self.image = UIImage(named: "tabBarbg2")
        self.backgroundColor = .orange
        self.layer.cornerRadius = self.heightv / 2
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count + 1)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.tag = i
            
            self.addSubview(itemView)
            
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
                itemView.widthAnchor.constraint(equalToConstant: itemWidth), // fixing width
                
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
            ])
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0)
    }
    
    func createTabItem(item: TabItem) -> UIView {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        let selectedItemView = UIImageView(frame: CGRect.zero)
        
        // adding tags to get views for modification when selected/unselected
        
        tabBarItem.tag = 11
        itemTitleLabel.tag = 12
        itemIconView.tag = 13
        selectedItemView.tag = 14
        
        selectedItemView.image = UIImage(named: "selectedTab")
        selectedItemView.translatesAutoresizingMaskIntoConstraints = false
        selectedItemView.clipsToBounds = true
        tabBarItem.addSubview(selectedItemView)
        NSLayoutConstraint.activate([
            selectedItemView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            selectedItemView.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor),
            selectedItemView.heightAnchor.constraint(equalToConstant: 30),
            selectedItemView.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        selectedItemView.layer.cornerRadius = 0
        tabBarItem.sendSubviewToBack(selectedItemView)
        
        selectedItemView.isHidden = true
        
        
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.font = UIFont.systemFont(ofSize: 12)
        itemTitleLabel.textColor = .white // changing color to white
        itemTitleLabel.textAlignment = .left
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.isHidden = true // hiding label for now
        
        itemIconView.image = item.icon!.withRenderingMode(.automatic)
        itemIconView.contentMode = .scaleAspectFit // added to stop stretching
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        tabBarItem.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 24), // Fixed height for our tab item(25pts) changed to 15
            itemIconView.widthAnchor.constraint(equalToConstant: 24), // Fixed width for our tab item icon changed to 15
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor), // adding to make icon exact center
            //itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 8), // Position menu item icon 8pts from the top of it's parent view; commenting old y position
            //itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35), s: fixed height of its superview so don't need this, thus commenting
            
            itemTitleLabel.heightAnchor.constraint(equalToConstant: 13), // Fixed height for title label
            //itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor), // Position label full width across tab bar item
            itemTitleLabel.leadingAnchor.constraint(equalTo: itemIconView.trailingAnchor, constant: 5),
            itemTitleLabel.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor)
            //itemTitleLabel.topAnchor.constraint(equalTo: itemIconView.bottomAnchor, constant: 4), // Position title label 4pts below item icon, s: changinf postion of label so don't need this
            ])
        
        //MARK: Comment
//        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) // Each item should be able to trigger and action on tap
        let precisionTap = customTap(target: self, action: #selector(actionB(sender:)))
        precisionTap.cutomTag = item
        tabBarItem.addGestureRecognizer(precisionTap)
        
        return tabBarItem
    }
    
    @objc func actionB(sender: UIGestureRecognizer) {
    // important to cast your sender to your cuatom class so you can extract your special setting.
        let tap = sender as? customTap
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
        switch tap?.cutomTag {
        case .home:
            print("\(tap?.cutomTag?.icon)")
            
            break
        default: break
        }
      
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    
    func activateTab(tab: Int) {
        
        let tabToActivate = self.subviews[tab]
//        tabToActivate.backgroundColor = .black
        // showing title label on selection
        
        tabToActivate.viewWithTag(12)?.isHidden = false // showing label
        tabToActivate.viewWithTag(14)?.isHidden = false // showing selected
        
        // changing constraints for animation
        
        NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .centerX}))
        
        NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.centerXAnchor.constraint(equalTo: tabToActivate.centerXAnchor, constant: -20)])
        
       
        
        // transform effect for selectedtab background
        UIView.animate(withDuration: 0.25, animations: {
            tabToActivate.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.layoutIfNeeded()
        }) { (Bool) in
            
            
            tabToActivate.viewWithTag(14)?.isHidden = false
        }
        
        self.itemTapped?(tab)
        
        self.activeItem = tab
    }
    
    func deactivateTab(tab: Int) {
        
        let inactiveTab = self.subviews[tab]
        
        // hiding label again when deselected
        inactiveTab.viewWithTag(12)?.isHidden = true
        //inactiveTab.viewWithTag(14)?.isHidden = true
        
        // changing constraints for animation
        
        NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .centerX}))
        
        NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.centerXAnchor.constraint(equalTo: inactiveTab.centerXAnchor)])
        
            self.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.25, animations: {
            inactiveTab.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.layoutIfNeeded()
        }) { (Bool) in
            inactiveTab.viewWithTag(14)?.isHidden = true
        }
        
    
        
    }
}

extension UIView {

    func asImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
            defer { UIGraphicsEndImageContext() }
            guard let currentContext = UIGraphicsGetCurrentContext() else {
                return nil
            }
            self.layer.render(in: currentContext)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    }
}
