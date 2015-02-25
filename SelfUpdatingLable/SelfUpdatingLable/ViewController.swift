//
//  ViewController.swift
//  SelfUpdatingLable
//
//  Created by Manuel Meyer on 24/02/15.
//  Copyright (c) 2015 GoEuro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var todayLabel: UILabel!
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingTodayLabel()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "settingTodayLabel", name: UIApplicationDidBecomeActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "settingTodayLabel", name: "DateChangedNewDay", object: nil)

    }
    
    func settingTodayLabel() {
        let todayFormatter = NSDateFormatter()
        todayFormatter.dateFormat = "d MMM yyyy HH:mm"
        todayLabel.text = todayFormatter.stringFromDate(NSDate())
    }
}

