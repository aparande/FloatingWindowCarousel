//
//  CarouselController.swift
//  FloatingWindowCarousel
//
//  Created by Anmol Parande on 6/14/16.
//  Copyright © 2016 Anmol Parande. All rights reserved.
//
//This just serves to test out the functionality of the FloatingCarousel class

import UIKit

class CarouselController: FloatingCarousel {

    @IBOutlet weak var viewOneLabel: UILabel!
    
    @IBOutlet var firstView: CarouselView!
    @IBOutlet var secondView: CarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSBundle.mainBundle().loadNibNamed("CarouselViews", owner: self, options: nil)
        self.addViewsToCarousel([firstView, secondView])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func next(sender: AnyObject) {
        super.next()
    }
    @IBAction func previous(sender: AnyObject) {
        super.previous()
    }
}
