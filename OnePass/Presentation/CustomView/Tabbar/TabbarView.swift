//
//  TabbarView.swift
//  OnePass
//
//  Created by Duy Tran on 21/10/2022.
//

import UIKit

class TabbarView: UIView {
    
    let screenSize: CGRect = UIScreen.main.bounds
    var stackView: UIStackView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        clipsToBounds = true
    }
    
    func setup() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = createBezierPath().cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.position = CGPoint(x: 0, y: 0)
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func createBezierPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        let widthView: CGFloat = screenSize.width - 30
        let heightView: CGFloat = 64
        //Start
        
        path.move(to: CGPoint(x: widthView/2, y: heightView))
        //1
        path.addLine(to: CGPoint(x: heightView/2, y: heightView))
        //2
        path.addArc(withCenter: CGPoint(x: heightView/2, y: heightView/2),
                    radius: 32,
                    startAngle: CGFloat(M_PI_2),
                    endAngle: CGFloat(3*M_PI_2),
                    clockwise: true)

        //3
        path.addLine(to: CGPoint(x: widthView - 74 - 32, y: 0))
        //4
        path.addArc(withCenter: CGPoint(x: widthView - 74 - 32, y: heightView/2),
                    radius: 32,
                    startAngle: CGFloat(3*M_PI_2),
                    endAngle: CGFloat(0),
                    clockwise: true)
        //5
        path.addArc(withCenter: CGPoint(x: widthView - 43, y: heightView - 43),
                    radius: 33,
                    startAngle: CGFloat(M_PI),
                    endAngle: CGFloat(M_PI_2),
                    clockwise: false)

        
        //6
        path.addLine(to: CGPoint(x: widthView-10, y: heightView-10))
        //7
        path.addArc(withCenter: CGPoint(x: widthView-5, y: heightView-5),
                    radius: 5,
                    startAngle: CGFloat(3*M_PI_2),
                    endAngle: CGFloat(M_PI_2),
                    clockwise: true)
        path.close()
     
        return path
    }
}
