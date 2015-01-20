//
//  ModalViewController.swift
//  TebTest
//
//  Created by Elena Da Re on 1/18/15.
//  Copyright (c) 2015 Elena Da Re. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
	
	override init() {
		super.init(nibName: nil, bundle: nil)
		modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
		modalTransitionStyle = UIModalTransitionStyle.CoverVertical
	}

	required init(coder aDecoder: NSCoder) {
	    super.init(coder: aDecoder)
	}
	
	override func loadView() {
		view = ModalView(modalViewController: self);
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func slideDownModal() {
		//self.dismissViewControllerAnimated(true, completion: {})
		presentingViewController!.dismissViewControllerAnimated(true, completion: nil);
	}
	
	func touchUpInside(button: UIButton!) {
		slideDownModal()
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
