//
//  MemeSentViewController.swift
//  ImagePicker
//
//  Created by Badri Narayanan Ravichandran Sathya on 6/23/16.
//  Copyright © 2016 Badri Mira. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme] = []
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(memes.count)
        return self.memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewMemeCell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.memeImageView?.image = memes[indexPath.row].memedImage
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let destinationVC = self.storyboard!.instantiateViewControllerWithIdentifier("memeDetailViewController") as! MemeDetailViewController
        let meme = memes[indexPath.row]
        destinationVC.memedImage = meme.memedImage!
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func addMemeAction(sender: AnyObject) {
        let destinationVC = self.storyboard!.instantiateViewControllerWithIdentifier("memeCreatorController") as! MemeController
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2*space))/3.0;
        
        flowLayout.minimumLineSpacing = space;
        flowLayout.minimumInteritemSpacing = space;
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        self.collectionView!.reloadData()

    }
    
    override func collectionView(collectionView: UICollectionView, canMoveItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let meme = memes[sourceIndexPath.row]
        memes.removeAtIndex(sourceIndexPath.row)
        memes.insert(meme, atIndex: destinationIndexPath.row)
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes = memes
    }
    
}
