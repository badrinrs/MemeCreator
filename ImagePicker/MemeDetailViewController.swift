//
//  MemeDetailController.swift
//  ImagePicker
//
//  Created by Badri Narayanan Ravichandran Sathya on 6/26/16.
//  Copyright © 2016 Badri Mira. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var memeDetailImageView: UIImageView!
    
    var memedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeDetailImageView.image = memedImage
    }
    
}
