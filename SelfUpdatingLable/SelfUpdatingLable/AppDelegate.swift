    //
//  AppDelegate.swift
//  SelfUpdatingLable
//
//  Created by Manuel Meyer on 24/02/15.
//  Copyright (c) 2015 Manuel Meyer All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let notificationType = UIUserNotificationType.None
        let settings = UIUserNotificationSettings(forTypes: notificationType, categories: nil)
        application.registerUserNotificationSettings(settings)
        
        
        var localNotification:UILocalNotification = UILocalNotification()

        localNotification.fireDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate())
        localNotification.repeatInterval = NSCalendarUnit.CalendarUnitMinute
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        
        
        return true
    }

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        NSNotificationCenter.defaultCenter().postNotificationName("DateChangedNewDay", object: nil)
    }

}

