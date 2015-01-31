//
//  TableViewController.swift
//  TebTest
//
//  Created by Elena Da Re on 1/11/15.
//  Copyright (c) 2015 Elena Da Re. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITextFieldDelegate {
	let cellReuseIdentifier: String = "section"

	
	let headers: [String] = [
		"\n YOUR DATA",
		"SCORE",
		"IMPORTANT"
	]
	
	let zones: [[String]] = [
		[
		"First Name",
		"Last Name"
		],
	
		[
		"Snow",
		"Hawaii",
		"Amazon"
		],
		
		[
		"Terms and conditions",
		"Privacy policy",
		"Send to a friend",
		"Leave a review"
		]
	]
	
	override init(nibName: String?, bundle: NSBundle?) {
		super.init(nibName: nil, bundle: nil);
		self.title = "Score";
		tabBarItem.image = UIImage(named: "TabScore")
	}
	
	override init(style: UITableViewStyle) {
		super.init(style: style)
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "section");
		tableView.bounces = true;
		tableView.scrollsToTop = true;
		tableView.decelerationRate = UIScrollViewDecelerationRateNormal;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return zones.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
		assert(0 <= section && section < zones.count);
        return zones[section].count
    }

	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("section", forIndexPath: indexPath) as UITableViewCell
		
        // Configure the cell...
		cell.textLabel!.text = zones[indexPath.section][indexPath.row];
		let fileName: String = cell.textLabel!.text! + ".jpg";
		cell.imageView!.image = UIImage(named: fileName);	//nil if .jpg file doesn't exist
		
		if indexPath.section == 0 {
			cell.textLabel!.textColor = UIColor.grayColor()
		}
		
		//add the disclosure indicator
		if indexPath.section == 2 {
				cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
		}
		
		return cell;
    }
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return headers[section];
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell: UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath);
		let textField: UITextField = UITextField(frame: cell!.textLabel!.frame)
		
		// add the checkmarks
		if indexPath.section == 1 {
			if cell != nil {
				if cell!.accessoryType == UITableViewCellAccessoryType.None {
					cell!.accessoryType = UITableViewCellAccessoryType.Checkmark;
				} else {
					cell!.accessoryType = UITableViewCellAccessoryType.None;
				}
			}
		}
		
		// all three checkmarks at the same time for the slideUpModal func
		if indexPath.section == 1{
			
			if tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 1))!.accessoryType == UITableViewCellAccessoryType.Checkmark
				
				&& tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 1))!.accessoryType == UITableViewCellAccessoryType.Checkmark
				
				&& tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 1))!.accessoryType == UITableViewCellAccessoryType.Checkmark {
					slideUpModal();
			}
		}

		// adding the text field
		if indexPath.section == 0 {
			if indexPath.row == 0 {
				//cell.textLabel.text =  "hello";
				let font: UIFont = cell!.textLabel!.font;
				let dy: CGFloat = (cell!.textLabel!.bounds.size.height - font.lineHeight) / 2;
				let frame: CGRect = CGRectMake(
					cell!.textLabel!.frame.origin.x,
					cell!.textLabel!.frame.origin.y + dy,
					cell!.textLabel!.bounds.size.width,
					cell!.textLabel!.bounds.size.height - dy
				);
				//let textField: UITextField = UITextField(frame: cell!.textLabel.frame)
				textField.backgroundColor = cell!.textLabel!.backgroundColor
				textField.textColor = UIColor.blackColor()
				textField.placeholder = "First Name"
				textField.autocorrectionType = UITextAutocorrectionType.No
				textField.delegate = self
				
				cell!.textLabel!.text = nil
				cell!.addSubview(textField)
				textField.becomeFirstResponder()
			}
			if indexPath.row == 1 {
				let font: UIFont = cell!.textLabel!.font;
				let dy: CGFloat = (cell!.textLabel!.bounds.size.height - font.lineHeight) / 2;
				let frame: CGRect = CGRectMake(
					cell!.textLabel!.frame.origin.x,
					cell!.textLabel!.frame.origin.y + dy,
					cell!.textLabel!.bounds.size.width,
					cell!.textLabel!.bounds.size.height - dy
				);
				//let textField: UITextField = UITextField(frame: cell!.textLabel.frame)
				textField.backgroundColor = cell!.textLabel!.backgroundColor
				textField.textColor = UIColor.blackColor()
				textField.placeholder = "Last Name"
				//textField.font = cell.textLabel.font
				textField.autocorrectionType = UITextAutocorrectionType.No
				textField.delegate = self
				
				cell!.textLabel!.text = nil
				cell!.addSubview(textField)
				textField.becomeFirstResponder()
			}
		}
		
		//Add the other view controllers for the disclosure indicator
		let ip0: NSIndexPath = NSIndexPath(forRow: 0, inSection: 2)
		let ip1: NSIndexPath = NSIndexPath(forRow: 1, inSection: 2)
		
		
		if indexPath.compare(ip0) == NSComparisonResult.OrderedSame {
			
			//if indexPath.section == 0 && indexPath.row == 0 {
			
			
			let newViewController: UIViewController = UIViewController(nibName: nil, bundle: nil);
			//newViewController.title = name;
			let newView: UIView = UIView(frame: CGRectZero)
			newViewController.view = newView;
			let navigationController: UINavigationController = UINavigationController(rootViewController: TableViewController(nibName: nil, bundle: nil))
			navigationController.pushViewController(newViewController, animated: true)
			
			println("selected photo");
			
			//let secondController: PhotoController = PhotoController(title: "Photo");
			//navigationController!.pushViewController(secondController, animated: true);
			
		} /*else if indexPath.compare(ip1) == NSComparisonResult.OrderedSame {
			//} else if indexPath.section == 0 && indexPath.row == 1  {
			println("selected video");
			
			
			let thirdController: VideoController =
			VideoController(title: "Video");
			navigationController!.pushViewController(thirdController, animated: true);
			
		} else	{
			return;
		}
		*/
		
		
		/*
		
		if indexPath.compare(ip0) == NSComparisonResult.OrderedSame {
			println("here")
		
		//ip refers to a tree that is a leaf.  Display its Wikipedia article.
		let name: NSString = "Terms and conditions";
			println("and here")
		var string: NSString =
		name.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!;
		string = "http://en.m.wikipedia.org/wiki/".stringByAppendingString(string);
		let url: NSURL? = NSURL(string: string);
		let data: NSData? = NSData(contentsOfURL: url!);
		
		if data == nil {
			println("could not load URL \(url)");
		} else {
			let webView: UIWebView = UIWebView(frame: CGRectZero);
			webView.scalesPageToFit = true;
			webView.loadData(data, MIMEType: "text/html", textEncodingName: "NSUTF8StringEncoding", baseURL: url);
			println("what about here")
			
			//Give the web view a generic view controller.
			let viewController: UIViewController = UIViewController(nibName: nil, bundle: nil);
			viewController.title = name;
			viewController.view = webView;
			//navigationController!.pushViewController(viewController, animated: true);
			println("here too")
		}
		}
		*/
		
		
		
		
		
		
		
		
		
		
	}
	
	//called when the return key pressed and/or when move to a different cell
	func textFieldShouldReturn (textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	
	func slideUpModal() {
		let modalViewController: ModalViewController = ModalViewController();
		presentViewController(modalViewController, animated: true, completion: nil)
	}

	
	
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
