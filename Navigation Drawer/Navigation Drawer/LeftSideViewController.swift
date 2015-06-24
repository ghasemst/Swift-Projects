//
//  LeftSideViewController.swift
//  Navigation Drawer
//
//  Created by Ghasem Tabatabaei on 24/06/15.
//  Copyright © 2015 Ghasem Tabatabaei. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menuItems:[String] = ["Main", "About"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var myCell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCustomTableViewCell
        
        myCell.menuItemLabel.text = menuItems[indexPath.row]
        return myCell
    }
    
    
    // For Tabbing on Cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.row)
        {
        
        case 0:
            var centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            
            var centerNavController = UINavigationController(rootViewController: centerViewController)
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = centerNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            
            break;
            
        case 1:
            var aboutViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AboutViewController") as! AboutViewController
            
            var aboutNavController = UINavigationController(rootViewController: aboutViewController)
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = aboutNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            
            break;
            
        default:
            print("\(menuItems[indexPath.row]) is selected");
            
        }
    }
}
