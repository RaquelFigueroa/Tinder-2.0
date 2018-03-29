//
//  CardsViewController.swift
//  Tinder
//
//  Created by Raquel Figueroa-Opperman on 3/28/18.
//  Copyright © 2018 RaquelFigueroa. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    var cardInitialCenter: CGPoint!

    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("started!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanCardView(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        //        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = cardView.center
            
        } else if sender.state == .changed {
            print("Gesture is changing")
            cardView.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y + translation.y)
        } else if sender.state == .ended {
            print("Gesture ended")
        }
    }
    
}
