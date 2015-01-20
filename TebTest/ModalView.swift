//
//  ModalView.swift
//  TebTest
//
//  Created by Elena Da Re on 1/18/15.
//  Copyright (c) 2015 Elena Da Re. All rights reserved.
//

import UIKit

class ModalView: UILabel {
	let modalViewController: ModalViewController;
	
	init(modalViewController: ModalViewController) {
		// Initialization code
		self.modalViewController = modalViewController;
		super.init(frame: CGRectZero);
		
		let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
		button.bounds.size = CGSizeMake(150, 40)
		button.center = CGPointMake(center.x, 410)
		
		button.autoresizingMask =
			UIViewAutoresizing.FlexibleLeftMargin
			| UIViewAutoresizing.FlexibleRightMargin
			//| UIViewAutoresizing.FlexibleTopMargin
			//| UIViewAutoresizing.FlexibleBottomMargin;*/
		
		button.backgroundColor = UIColor.clearColor();
		button.layer.borderWidth = 0.5;	//0.5 pairs of pixels = 1 pixel
		button.layer.borderColor = UIColor.whiteColor().CGColor;
		button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
		button.setTitle("OK", forState: UIControlState.Normal);
		
		button.addTarget(modalViewController,
			action: "touchUpInside:",
			forControlEvents: UIControlEvents.TouchUpInside);
		
		addSubview(button);
		
		backgroundColor = UIColor.blackColor();
		alpha = 0.75
		textAlignment = NSTextAlignment.Center;
		numberOfLines = 4
		text =
			"CONGRATULATIONS! \n" +
			"\n" +
			"You have successfully \n" +
			"completed the game";
		textColor = UIColor.whiteColor()
		userInteractionEnabled = true; //Make this label touch-sensitive.
	}
	
	//Never called.
	required init(coder aDecoder: NSCoder) {
		let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate! as AppDelegate;
		let mainViewController: TableViewController = appDelegate.window!.rootViewController! as TableViewController;
		modalViewController = mainViewController.presentingViewController! as ModalViewController;
		super.init(coder: aDecoder);
	}
	
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		modalViewController.slideDownModal();
	}
	
	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect) {
	// Drawing code
	}
	*/
	
}
