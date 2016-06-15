//
//  FloatingCarousel.swift
//  FloatingWindowCarousel
//
//  Created by Anmol Parande on 6/14/16.
//  Copyright © 2016 Anmol Parande. All rights reserved.
//

import UIKit

class FloatingCarousel: UIViewController {
    
    var carouselViews: [CarouselView] = []
    var currentIndex = 0
    var currentView: CarouselView!
    var carouselGap: CGFloat = 20
    
    func addViewsToCarousel(views: [CarouselView]) {
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        var counter: CGFloat = -1;
        for view in views {
            counter += 1
            if counter == 0 {
                view.frame = CGRectMake(carouselGap, carouselGap, screenWidth-carouselGap*2, screenHeight-carouselGap*2)
            } else {
                view.frame = CGRectMake(screenWidth*counter+carouselGap, carouselGap, screenWidth-carouselGap*2, screenHeight-carouselGap*2)
            }
        }
        if let _ = currentView {
            carouselViews.appendContentsOf(views)
        } else {
            carouselViews = []
            carouselViews.appendContentsOf(views)
            self.view.addSubview(carouselViews[0])
            currentView = carouselViews[0]
            for i in 1...carouselViews.count-1 {
                carouselViews[i].isFirstView = false
                carouselViews[i].isOnScreen = false
            }
        }
    }
    
    @IBAction func next(sender: AnyObject) {
        currentIndex += 1
        if currentIndex == carouselViews.count {
            currentIndex -= 1
            return
        }
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        self.view.addSubview(carouselViews[currentIndex])
        
     //   print("Current Index \(currentIndex), x coord of view is: \(carouselViews[currentIndex].frame.origin.x)")
        
        UIView.animateWithDuration(0.5, animations: {
            var counter:CGFloat = -1
            for view in self.carouselViews {
                counter += 1
                view.frame.origin.x -= screenWidth
            }
        }, completion: {
            success in
                
            self.currentView.isOnScreen = false
            self.view.willRemoveSubview(self.currentView)
            
            self.currentView = self.carouselViews[self.currentIndex]
            self.currentView.isOnScreen = true
            
          //  print("x coord of view is: \(self.carouselViews[self.currentIndex].frame.origin.x)")
        })
    }
    
    @IBAction func previous(sender: AnyObject) {
        currentIndex -= 1
        if currentIndex == -1 {
            currentIndex += 1
            return
        }
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        self.view.addSubview(carouselViews[currentIndex])
        
        //   print("Current Index \(currentIndex), x coord of view is: \(carouselViews[currentIndex].frame.origin.x)")
        
        UIView.animateWithDuration(0.5, animations: {
            for view in self.carouselViews {
                view.frame.origin.x += screenWidth
            }
            }, completion: {
                success in
                
                self.currentView.isOnScreen = false
                self.view.willRemoveSubview(self.currentView)
                
                self.currentView = self.carouselViews[self.currentIndex]
                self.currentView.isOnScreen = true
                
                //  print("x coord of view is: \(self.carouselViews[self.currentIndex].frame.origin.x)")
        })
    }
}

