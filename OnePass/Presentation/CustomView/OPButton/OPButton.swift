//
//  OPButton.swift
//  OnePass
//
//  Created by Duy Tran on 19/10/2022.
//

import UIKit


@IBDesignable
class OPButton: UIButton {
    
    enum OPButtonType: Int {
        case CANCEL_TYPE
        case CONFIRM_TYPE
        case CHECKBOX_TYPE_ROUND
        case CHECKBOX_IMG
        case TWO_LINE
        case IMG_LEFT
        case IMG_RIGHT
        case BTN_PLUS
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var backgrColor: UIColor = .white {
        didSet {
            self.layer.backgroundColor = backgrColor.cgColor
        }
    }
    
    @IBInspectable var boderWith: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = boderWith
        }
    }
    
    @IBInspectable var boderWithColor: UIColor = .black {
        didSet {
            self.layer.borderColor = boderWithColor.cgColor
        }
    }
    
    @IBInspectable var TitleColor: UIColor = .black {
        didSet {
            self.setTitleColor(TitleColor, for: .normal)
        }
    }
    
    @IBInspectable var Title: String = "" {
        didSet {
            self.setTitle(Title, for: .normal)
        }
    }
    
    @IBInspectable var SubTitle: String = "" {
        didSet {
            self.updateView()
        }
    }

    
    var type: OPButtonType = .CANCEL_TYPE
    
    @IBInspectable
     var TypeBtn: Int = 0 {
         didSet {
             self.type = OPButtonType(rawValue: TypeBtn) ?? .CANCEL_TYPE
             self.updateView()
         }
     }
    
    @IBInspectable var image: UIImage? {
        didSet {
            self.updateView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func updateView() {
        
        switch type {
        case .CANCEL_TYPE:
            cancelBtn(title: Title)
        case .CONFIRM_TYPE:
            confirmBtn(title: Title)
        case .CHECKBOX_TYPE_ROUND:
            self.isSelected = true
            checkboxSelected(type: .CHECKBOX_TYPE_ROUND)
            checkboxAction(type: .CHECKBOX_TYPE_ROUND)
        case .TWO_LINE:
            setupSubTitle(title: Title, sub: SubTitle)
        case .IMG_LEFT:
            buttonLeftImg(title: Title, img: image)
        case .CHECKBOX_IMG:
            self.isSelected = true
            checkboxSelected(type: .CHECKBOX_IMG)
            checkboxAction(type: .CHECKBOX_IMG)
        case .IMG_RIGHT:
            buttonRightImg(title: Title, img: image)
        case .BTN_PLUS:
            setupBtnPlus()
        }
    }
    
    func setupBtn(type: OPButtonType, title: String, subTitle: String) {
        
        switch type {
        case .CANCEL_TYPE:
            cancelBtn(title: title)
        case .CONFIRM_TYPE:
            confirmBtn(title: title)
        case .CHECKBOX_TYPE_ROUND:
            self.isSelected = true
            checkboxSelected(type: .CHECKBOX_TYPE_ROUND)
            checkboxAction(type: .CHECKBOX_TYPE_ROUND)
        case .TWO_LINE:
            setupSubTitle(title: title, sub: subTitle)
        case .IMG_LEFT:
            buttonLeftImg(title: title, img: "16X16AddMore")
        case .CHECKBOX_IMG:
            self.isSelected = true
            checkboxSelected(type: .CHECKBOX_IMG)
            checkboxAction(type: .CHECKBOX_IMG)
        case .IMG_RIGHT:
            buttonRightImg(title: title, img: "24X24Next")
        case .BTN_PLUS: break
            
        }
    }


    func setupBtnPlus() {
        self.cornerRadius = self.heightv / 2
        self.backgrColor = UIColor.colorFromHex("E6704E")
        self.setImage(UIImage(named: "icPlus"), for: .normal)
    }
    
    private func setupButton() {
        self.cornerRadius = 8
    }
    
    
    func cancelBtn(title: String) {
        self.backgrColor = .white
        self.boderWith = 1
        self.boderWithColor = .cgRGB(rgb: "219 163 16")
        
        var ButtonTitle: UILabel!
        ButtonTitle = UILabel()
        ButtonTitle.text = title
//        ButtonTitle.font = VNAFonts.fontMedium(15)
        ButtonTitle.textColor = .cgRGB(rgb: "219 163 16")
        self.addSubview(ButtonTitle)
        ButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        ButtonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ButtonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        

    }
    
    func confirmBtn(title: String) {
        
        self.backgrColor = .cgRGB(rgb: "219 163 16")
        
        var ButtonTitle: UILabel!
        ButtonTitle = UILabel()
        ButtonTitle.text = title
//        ButtonTitle.font = VNAFonts.fontMedium(15)
        ButtonTitle.textColor = .white
        self.addSubview(ButtonTitle)
        ButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        ButtonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ButtonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    }

    
    func checkboxAction(type: OPButtonType) {
        
        self.addAction {
            if type == .CHECKBOX_TYPE_ROUND {
                if self.isSelected {
                    print("fff")
                    self.isSelected = false
                    self.checkboxNotSelect(type: type)
                } else {
                    print("ok")
                    self.isSelected = true
                    self.checkboxSelected(type: type)
                }
            }
            
            if type == .CHECKBOX_IMG {
                if self.isSelected {
                    print("fff")
                    self.isSelected = false
                    self.checkboxNotSelect(type: type)
                } else {
                    print("ok")
                    self.isSelected = true
                    self.checkboxSelected(type: type)
                }

            }

        }
    }
    
    func checkboxSelected(type: OPButtonType) {
        
        if type == .CHECKBOX_TYPE_ROUND {
            self.Title = ""
            self.backgrColor = .white
            self.cornerRadius = self.frame.height/2
            self.boderWith = 7
            self.boderWithColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)
        }
        
        if type == .CHECKBOX_IMG {
            self.Title = ""
            self.backgrColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)
            self.cornerRadius = 6
            self.boderWith = 0
            self.setImage(UIImage(named: "path2"), for: .normal)
        }
        
    }
    
    func checkboxNotSelect(type: OPButtonType) {
        
        if type == .CHECKBOX_TYPE_ROUND {
            self.Title = ""
            self.backgrColor = .white
            self.cornerRadius = self.frame.height/2
            self.boderWith = 1
            self.boderWithColor = .rgbColor(red: 232, green: 232, blue: 232, alpha: 1)
        }
        
        if type == .CHECKBOX_IMG {
            self.Title = ""
            self.backgrColor = .clear
            self.cornerRadius = 6
            self.boderWithColor = .cgRGB(rgb: "155 155 155")
            self.boderWith = 1
            self.setImage(nil, for: .normal)
        }

        
    }

    func buttonLeftImg(title: String, img: UIImage?) {
        
        self.boderWithColor = .clear
        self.backgrColor = .white
        self.setTitle("", for: .normal)
        
        var ButtonTitle: UILabel!
        ButtonTitle = UILabel()
        ButtonTitle.text = title
        ButtonTitle.textColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)

        let img = UIImageView(image: img)
        
        self.addSubview(img)
        self.addSubview(ButtonTitle)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        ButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        img.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 24).isActive = true
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        ButtonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ButtonTitle.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 4).isActive = true
        ButtonTitle.heightAnchor.constraint(equalToConstant: 18).isActive = true

        
    }
    
    func buttonLeftImg(title: String, img: String) {
        
        self.boderWithColor = .clear
        self.backgrColor = .white
        
        var ButtonTitle: UILabel!
        ButtonTitle = UILabel()
        ButtonTitle.text = title
        ButtonTitle.textColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)

        let img = UIImageView(image: UIImage(named: img))
        
        self.addSubview(img)
        self.addSubview(ButtonTitle)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        ButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        img.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 24).isActive = true
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        ButtonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ButtonTitle.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 4).isActive = true
        ButtonTitle.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }

    func buttonRightImg(title: String, img: String) {
        
        self.boderWithColor = .clear
        self.backgrColor = .white
        
        var ButtonTitle: UILabel!
        ButtonTitle = UILabel()
        ButtonTitle.text = title
        ButtonTitle.textColor = .white
        self.backgrColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)

        let img = UIImageView(image: UIImage(named: img))
        
        self.addSubview(img)
        self.addSubview(ButtonTitle)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        ButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        img.leftAnchor.constraint(equalTo: ButtonTitle.rightAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 24).isActive = true
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.centerYAnchor.constraint(equalTo: ButtonTitle.centerYAnchor).isActive = true
        
        ButtonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ButtonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ButtonTitle.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    func buttonRightImg(title: String, img: UIImage?) {
        
        self.boderWithColor = .clear
        self.backgrColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)
        self.setTitle("", for: .normal)
        
        var ButtonTitle: UILabel!
        ButtonTitle = UILabel()
        ButtonTitle.text = title
        ButtonTitle.textColor = .white
        
        
        let img = UIImageView(image: img)
        
        self.addSubview(img)
        self.addSubview(ButtonTitle)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        ButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        img.leftAnchor.constraint(equalTo: ButtonTitle.rightAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 24).isActive = true
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.centerYAnchor.constraint(equalTo: ButtonTitle.centerYAnchor).isActive = true
        
        ButtonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ButtonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ButtonTitle.heightAnchor.constraint(equalToConstant: 18).isActive = true

        
    }
    
    func isBtnSelected(isSelect: Bool) {
        if isSelect {
            self.isSelected = !isSelect
            
            checkboxSelected(type: .CHECKBOX_TYPE_ROUND)
        } else {
            self.isSelected = isSelect
            checkboxNotSelect(type: .CHECKBOX_TYPE_ROUND)
        }
    }
    
    private func setupSubTitle(title: String, sub: String) {
        
        self.backgrColor = .white
        self.cornerRadius = 8
        self.boderWith = 1
        self.boderWithColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)
        
        self.titleLabel?.isHidden = true
        self.Title = ""
        var subTitle: UILabel!
        subTitle = UILabel()
        subTitle.text = sub
        subTitle.textColor = .rgbColor(red: 144, green: 144, blue: 144, alpha: 1)
        
        
        var ButtonTitle: UILabel!
        ButtonTitle = UILabel()
        ButtonTitle.text = title
        ButtonTitle.textColor = .rgbColor(red: 219, green: 163, blue: 16, alpha: 1)

        subTitle.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        ButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(subTitle)
        self.addSubview(ButtonTitle)

        ButtonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ButtonTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        ButtonTitle.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        subTitle.centerXAnchor.constraint(equalTo: ButtonTitle.centerXAnchor).isActive = true
        subTitle.topAnchor.constraint(equalTo: ButtonTitle.bottomAnchor).isActive = true
        subTitle.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
    }
        
    
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "position")
    }
}
