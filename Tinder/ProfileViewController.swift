//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Raquel Figueroa-Opperman on 3/31/18.
//  Copyright © 2018 RaquelFigueroa. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    var segueImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = segueImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}


