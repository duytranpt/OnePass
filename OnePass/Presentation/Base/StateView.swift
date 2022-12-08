//
//  StateView.swift
//  OnePass
//
//  Created by Duy Tran on 18/11/2022.
//

import UIKit

class StateView: UIView {
    weak var navController: UINavigationController?
    private var crrStateIndex = 0
    let screenWidth: Int = Int(UIScreen.main.bounds.size.width)
    
    init?(initStateNumber state: Int, numberOfState: Int, navC: UINavigationController?) {
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 40))
        self.navController = navC
        crrStateIndex = numberOfState
        let space = screenWidth/(state + 1)
        var startSepe: CGFloat = 0
        for i in 0..<state {
            let checkButton = OPButton(initCircleButton: "\(i+1)", size: self.height)
            checkButton.tag = 100+i;
            checkButton.centerX = CGFloat((i + 1)*space)
            var sstate = 0
            if i+1 < numberOfState {
                sstate = -1
            }
            if i+1 > numberOfState {
                sstate = 1
            }
            checkButton.setStateButtonDark(state: sstate)
            self.addSubview(checkButton)
            if startSepe > 0 {
                let newView = UIView(frame: CGRect(x: startSepe - checkButton.width/6, y: self.height/2 - 0.25, width: checkButton.x - startSepe + 2*checkButton.width/5-2, height: 0.5))
                newView.backgroundColor = .white
                self.addSubview(newView)
            }
            startSepe = checkButton.xRight

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
