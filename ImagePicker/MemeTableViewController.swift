//
//  MemeTableViewController.swift
//  ImagePicker
//
//  Created by Badri Narayanan Ravichandran Sathya on 6/26/16.
//  Copyright © 2016 Badri Mira. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme] = []
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        self.tableView.reloadData()

    }
    
    @IBAction func addMeme(sender: AnyObject) {
        let destinationVC = self.storyboard!.instantiateViewControllerWithIdentifier("memeCreatorController") as! MemeController
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewMemeCell") as! TableViewCell
        let meme = memes[indexPath.row]
        
        cell.imageView?.image = meme.memedImage
        cell.memeLabel.text = meme.topText+" "+meme.bottomText
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let destinationVC = self.storyboard!.instantiateViewControllerWithIdentifier("memeDetailViewController") as! MemeDetailViewController
        let meme = memes[indexPath.row]
        destinationVC.memedImage = meme.memedImage!
        self.navigationController?.pushViewController(destinationVC, animated: true)

    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            memes.removeAtIndex(indexPath.row)
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes = memes
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let meme = memes.removeAtIndex(sourceIndexPath.row)
        memes.insert(meme, atIndex: destinationIndexPath.row)
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes = memes
    }
}
