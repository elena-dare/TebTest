//
//  SnowViewController.swift
//  TebTest
//
//  Created by Elena Da Re on 1/5/15.
//  Copyright (c) 2015 Elena Da Re. All rights reserved.
//

import UIKit

class SnowViewController: UIViewController {
	
	override init() {
		super.init(nibName: nil, bundle: nil);
		self.title = "Snow";
		tabBarItem.image = UIImage(named: "TabSnowSelected")
		
		/*
		if tabBarController?.selectedIndex != 0 {
			tabBarItem.image = UIImage(named: "TabSnowDeselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
		} else {
			tabBarItem.image = UIImage(named: "TabSnowSelected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
		}*/
		
		//tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 0);
		
		//UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.grayColor()], forState:.Normal)
		//UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()], forState:.Selected)
		//UITabBar.appearance().tintColor = UIColor.redColor()
		navigationItem.prompt = "Snow"
	
	}

	required init(coder aDecoder: NSCoder) {
	    super.init(coder: aDecoder)
	}
	
	override func loadView() {
		view = SnowView(frame: CGRectZero);
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
