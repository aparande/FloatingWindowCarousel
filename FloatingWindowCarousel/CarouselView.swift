//
//  CarouselView.swift
//  FloatingWindowCarousel
//
//  Created by Anmol Parande on 6/14/16.
//  Copyright © 2016 Anmol Parande. All rights reserved.
//

import UIKit

class CarouselView: UIView {
    
    var isFirstView: Bool
    var isOnScreen:Bool
    
    init(isFirstView:Bool, frame: CGRect) {
        self.isFirstView = isFirstView
        isOnScreen = isFirstView
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        isFirstView = true
        isOnScreen = true
        
        super.init(coder: aDecoder)
    }
    
    //Each carousel view has a next button
    //Each carousel view may have a previous button
    //Each carousel view should know if its the first view or not
    //Each carousel should know the gap to the next carousel view
    //Each carousel should know if it is on screen currently
    
}
