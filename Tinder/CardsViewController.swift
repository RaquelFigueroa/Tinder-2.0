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
    @IBOutlet weak var cardView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("started!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanCardView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let xTranslation = cardView.center.x - view.center.x
        
        if sender.state == .began {
            cardInitialCenter = cardView.center
            
        } else if sender.state == .changed {
            cardView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            cardView.transform = CGAffineTransform(rotationAngle: CGFloat(1 * Double.pi / 180))
            
            if xTranslation > 0 {
                cardView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(xTranslation) * Double.pi / 360))
            } else{
                cardView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(xTranslation) * Double.pi / 360))
            }
//            cardView.transform = view.transform.rotated(angle: CGFloat(45 * M_PI / 180))
            
        } else if sender.state == .ended {
            
            if (xTranslation > 50) {
                UIView.animate(withDuration: 0.5) {
                    self.cardView.center = CGPoint(x: self.cardInitialCenter.x + 500, y: self.cardInitialCenter.y)
                }
            } else if (xTranslation < -50) {
                UIView.animate(withDuration: 0.3) {
                    self.cardView.center = CGPoint(x: self.cardInitialCenter.x - 500, y: self.cardInitialCenter.y)
                }
            }
        }
    }
    
    @IBAction func onImageTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "profileSegue") {
            let profileViewController = segue.destination as! ProfileViewController
           profileViewController.segueImage = cardView.image
        }
    }
    
}
