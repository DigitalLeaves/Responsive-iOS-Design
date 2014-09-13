//
//  ResponsiveTableViewController.swift
//  ResponsiveCells
//
//  Created by Nacho on 13/9/14.
//  Copyright (c) 2014 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit

class ResponsiveTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // constants
    let kResponsiveTableViewCellName = "ResponsiveTableViewCell"
    let kResponsiveTableViewCellImageTag = 1
    let kResponsiveTableViewCellLabelTag = 2
    let kResponsiveTableViewCellHeightUltraCompact = 42.0
    let kResponsiveTableViewCellHeightCompact = 80.0
    let kResponsiveTableViewCellHeightRegular = 120.0
    
    // outlets
    @IBOutlet weak var tableView: UITableView!
    
    // other
    let entries = ["calculator", "calendar", "camera", "chat-bubble", "cloud-download", "crest", "email", "file", "heart", "location-pointer", "lock", "paper-plane", "paste", "pie-chart", "search", "settings01", "settings02", "telephone", "video-play"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func letMeSeeMore(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    // table view data source methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kResponsiveTableViewCellName) as UITableViewCell
        
        // image
        if let imageView = cell.viewWithTag(kResponsiveTableViewCellImageTag) as? UIImageView {
            imageView.image = UIImage(named: entries[indexPath.row])
        }
        
        // label
        if let nameLabel = cell.viewWithTag(kResponsiveTableViewCellLabelTag) as? UILabel {
            nameLabel.text = entries[indexPath.row]
        }

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if traitCollection.horizontalSizeClass == .Compact { // compact horizontal size class
            if traitCollection.verticalSizeClass == .Compact { // compact vertical size class
                return CGFloat(kResponsiveTableViewCellHeightUltraCompact)
            }
            else { // regular vertical size class
                return CGFloat(kResponsiveTableViewCellHeightCompact)
            }
        } else { // regular size class
            return CGFloat(kResponsiveTableViewCellHeightRegular)
        }
    }
}





