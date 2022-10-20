//
//  BottomStackItem.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import Foundation

class BottomStackItem {
    
    var title: String
    var image: String
    var isSelected: Bool
    
    init(title: String,
         image: String,
         isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
    
}
