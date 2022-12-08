//
//  TimePickerToolBarView.swift
//  OnePass
//
//  Created by Duy Tran on 07/12/2022.
//

import UIKit

class TimePickerToolBarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let timePicker = createTimePicker()
        addSubview(timePicker)
        let toolBar = createUIToolBar()
        addSubview(toolBar)
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolBar.heightAnchor.constraint(equalToConstant: 44),
            toolBar.topAnchor.constraint(equalTo: topAnchor),
            toolBar.leftAnchor.constraint(equalTo: leftAnchor),
            toolBar.rightAnchor.constraint(equalTo: rightAnchor),
            timePicker.leftAnchor.constraint(equalTo: leftAnchor),
            timePicker.rightAnchor.constraint(equalTo: rightAnchor),
            timePicker.bottomAnchor.constraint(equalTo: bottomAnchor),
            timePicker.topAnchor.constraint(equalTo: toolBar.bottomAnchor),
        ])
    }
    
    private func createTimePicker() -> UIDatePicker {
        let timePicker:UIDatePicker = UIDatePicker(frame: .zero)
        timePicker.datePickerMode = UIDatePicker.Mode.time
        timePicker.minuteInterval = 15
        if #available(iOS 13.4, *) {
            timePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions where time picker is wheels style by default.
        }
        timePicker.addTarget(self, action: #selector(timeChanged(_:)), for: UIControl.Event.valueChanged)
        timePicker.backgroundColor = .white
        return timePicker
    }
    
    private func createUIToolBar() -> UIToolbar {
        let pickerToolbar = UIToolbar(frame: .zero)
        
        //customize the toolbar
        pickerToolbar.barStyle = .default
        pickerToolbar.barTintColor = UIColor.black
        pickerToolbar.backgroundColor = UIColor.white
        pickerToolbar.isTranslucent = false
        // add buttons
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnClicked(_:)))
        cancelButton.tintColor = UIColor.white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnClicked(_:)))
        doneButton.tintColor = UIColor.white
        
        //add the items to the toolbar
        pickerToolbar.items = [cancelButton, flexSpace, doneButton]
        return pickerToolbar
    }
    
    @objc func timeChanged(_ sender: UIDatePicker) {
       
    }
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        
    }
}
