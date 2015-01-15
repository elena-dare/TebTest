//
//  HawaiiView.swift
//  TebTest
//
//  Created by Elena Da Re on 1/5/15.
//  Copyright (c) 2015 Elena Da Re. All rights reserved.
//

import UIKit

class HawaiiView: UIView {
	
	//screen size
	let w = UIScreen.mainScreen().applicationFrame.size.width;
	let h = UIScreen.mainScreen().applicationFrame.size.height;
	
	//array of tuples to make the creation of tiles easier
	let a: [(filename: String, x: CGFloat, y: CGFloat, rotation: CGFloat)];
	let m:CGFloat;
	
	override init(frame: CGRect) {
		
		m = min(w, h);
		a = [("13.png", m*0.5, m*0.8, m*0.08), ("14.png", m*0.27, m*1.1, m*0.05), ("15.png", m*0.13, m*0.27, m*0.005), ("16.png", m*0.027, m*0.7, m*0.027), ("17.png", m*0.55, m*0.3, m*0.027), ("18.png", m*0.55, m*1.1, m*0.027), ("19.png", m*0.4, m*1.0, m*0.01), ("20.png", m*0.2, m*0.3, m*0.027), ("21.png", m*0.35, m*0.3, m*0.06)]
		
		super.init(frame: CGRectZero);
		
		for tuples in a {
			let tileView: TileView = TileView(filename: tuples.filename, x: tuples.x, y: tuples.y, rotation: tuples.rotation);
			tileView.frame = CGRectMake(tuples.x, tuples.y, m*0.35, m*0.35)
			tileView.transform = CGAffineTransformMakeRotation(tuples.rotation)
			addSubview(tileView);
		}
		
		//call drawrect when there is a tabcontroller
		contentMode = UIViewContentMode.Redraw
		
	}
	
	required init(coder aDecoder: NSCoder) {
		m = min(w, h);
		a = [("13.png", m*0.5, m*0.8, m*0.08), ("14.png", m*0.27, m*1.1, m*0.05), ("15.png", m*0.13, m*0.27, m*0.005), ("16.png", m*0.027, m*0.7, m*0.027), ("17.png", m*0.55, m*0.3, m*0.027), ("18.png", m*0.55, m*1.1, m*0.027), ("19.png", m*0.4, m*1.0, m*0.01), ("20.png", m*0.2, m*0.3, m*0.027), ("21.png", m*0.35, m*0.3, m*0.06)]
		super.init(coder: aDecoder)
	}
	
	
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect) {
		
		let snowViewController: SnowViewController = SnowViewController();
		
		if UIInterfaceOrientationIsPortrait(snowViewController.interfaceOrientation) {
			let backgroundImage: UIImage? = UIImage(named: "hawaiiPort.png");
			if backgroundImage == nil {
				println("could not find hawaiiPort.png");
				return;
			}
			//upper left corner of image
			let point: CGPoint = CGPointZero
			backgroundImage!.drawAtPoint(point);
			
		} else {
			
			let backgroundImage: UIImage? = UIImage(named: "hawaiiLand.png");
			if backgroundImage == nil {
				println("could not find hawaiiLand.png");
				return;
			}
			//upper left corner of image
			let point: CGPoint = CGPointZero
			backgroundImage!.drawAtPoint(point);
			
		}
		
	}
	
}
