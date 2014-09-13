//
//  ResponsiveCollectionViewController.swift
//  ResponsiveCells
//
//  Created by Nacho on 13/9/14.
//  Copyright (c) 2014 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit

class ResponsiveCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // constants
    let kResponsiveCollectionViewCellIdentifier = "ResponsiveCollectionViewCell"
    let kResponsiveCollectionViewCellImageTag = 1
    let kResponsiveCollectionSizeProportion = 1.0 // width/height (equal in this case)
    let kReadyCategoryCollectionViewCellSpanRegular = 40.0
    let kReadyCategoryCollectionViewCellSpanCompact = 20.0
    
    // outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    
    // button actions

    @IBAction func takeMeBack(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // collection view data source and delegate methods
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(kResponsiveCollectionViewCellIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        
        // image
        if let imageView = cell.viewWithTag(kResponsiveCollectionViewCellImageTag) as? UIImageView {
            imageView.image = UIImage(named: entries[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size
        let cellSpan = traitCollection.horizontalSizeClass == .Compact ? kReadyCategoryCollectionViewCellSpanCompact: kReadyCategoryCollectionViewCellSpanRegular
        let sideSize: Double = sqrt(Double(collectionViewSize.width * collectionViewSize.height) / (Double(entries.count))) - cellSpan
        return CGSize(width: sideSize * kResponsiveCollectionSizeProportion, height: sideSize)
    }
    
    // reacting to transitions.
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }

}
