//
//  AppDelegate.swift
//  TebTest
//
//  Created by Elena Da Re on 1/5/15.
//  Copyright (c) 2015 Elena Da Re. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		
		if window == nil {
			println("window is null");
			return true;
		}
			
		let tabBarController: UITabBarController = UITabBarController();
		
		tabBarController.viewControllers = [
			SnowViewController(),
			HawaiiViewController(),
			AmazonViewController(),
			TableViewController(style: UITableViewStyle.Grouped)
		]
		
		//let snowViewController: SnowViewController = SnowViewController()
		//let navigationController: UINavigationController = UINavigationController(nibName: nil, bundle: nil);
		//navigationController.pushViewController(snowViewController, animated: false);
		//snowViewController.append(navigationController);
		
		tabBarController.selectedIndex = 0 //unnecessary because starts from the first by default
		window!.rootViewController = tabBarController;
		
		//window!.rootViewController = TableViewController(style: UITableViewStyle.Grouped)
		
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

}

