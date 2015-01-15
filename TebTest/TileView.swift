//
//  TileView.swift
//  TebTest
//
//  Created by Elena Da Re on 1/5/15.
//  Copyright (c) 2015 Elena Da Re. All rights reserved.
//

import UIKit
import GLKit

class TileView: UIImageView {
	
	var centerAtStartOfPan: CGPoint = CGPointZero;
	var rotation: CGFloat = 0;
	
	required init(filename: String, x: CGFloat, y: CGFloat, rotation: CGFloat){
		super.init(image: UIImage(named: filename)!)
		
		center = CGPointMake(x, y);
		//transform = CGAffineTransformMakeRotation(rotation)
		
		
		let panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "pan:");
		panGestureRecognizer.minimumNumberOfTouches = 1;
		panGestureRecognizer.maximumNumberOfTouches = 1;
		addGestureRecognizer(panGestureRecognizer);
		
		let rotateGestureRecognizer: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: "rotate:")
		addGestureRecognizer(rotateGestureRecognizer);
		
		userInteractionEnabled = true; //UIImageView and UILabel are false by default
	}
	
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
	}
	
	
	func pan(panGestureRecognizer: UIPanGestureRecognizer) {
		superview!.bringSubviewToFront(self);// when panning takes the tileview to the top
		
		var d: CGPoint = panGestureRecognizer.translationInView(superview!);
		
		if panGestureRecognizer.state == UIGestureRecognizerState.Began {
			centerAtStartOfPan = CGPointMake(center.x + d.x, center.y + d.y)
		}
		
		if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
			center = CGPointMake(centerAtStartOfPan.x + d.x, centerAtStartOfPan.y + d.y)
		}
		
		if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
			center = CGPointMake(centerAtStartOfPan.x + d.x, centerAtStartOfPan.y + d.y)
		}
	}
	
	func rotate(rotateGestureRecognizer: UIRotationGestureRecognizer) {
		superview!.bringSubviewToFront(superview!);
		//Convert CGFloat to Float, because GLKMathRadiansToDegrees demands a Float parameter.
		let radians: Float = Float(rotateGestureRecognizer.rotation);
		let degrees: Float = GLKMathRadiansToDegrees(radians);
		
		self.transform = CGAffineTransformMakeRotation(rotateGestureRecognizer.rotation);
	}
	
	
	
	
	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect) {
	// Drawing code
	}
	*/
	
}
