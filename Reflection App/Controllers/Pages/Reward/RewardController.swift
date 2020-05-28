//
//  RewardController.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 13/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class RewardController: UIViewController {
    var reflectionDelegate: ReflectionDelegate!
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet weak var perlaImage: UIImageView!
    @IBOutlet weak var textViewReward: UITextView!
    @IBOutlet weak var labelReward: UILabel!
    @IBOutlet weak var plumeImage: UIImageView!
    
    var rewardText: String!
    
    var moveC : [UIImage] = []
    
    var imageName: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundImage.image = UIImage(named: self.imageName)
        
        plumeAnimation()
        self.perlaImage.startAnimating()
        self.textViewReward.text = rewardText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perlaImage.image = UIImage (named: "Animazione-conchiglia1")
        
        moveC = [UIImage (named: "Animazione-conchiglia1")!, UIImage (named: "Animazione-conchiglia2")!, UIImage (named: "Animazione-conchiglia3")!, UIImage (named: "Animazione-conchiglia4")!, UIImage (named: "Animazione-conchiglia5")!, UIImage (named: "Animazione-conchiglia5")!, UIImage (named: "Animazione-conchiglia4")!, UIImage (named: "Animazione-conchiglia3")!, UIImage (named: "Animazione-conchiglia2")!, UIImage (named: "Animazione-conchiglia1")!]
        
        perlaImage.animationDuration = 2.6
        perlaImage.animationImages = moveC
        
        //        Add BubbleEmitter
        addBubblesAnimation(x: view.bounds.width, y: view.bounds.height, myView: self.view)
        
    }
    
    func plumeAnimation()  {
        
        UIView.animate(withDuration: 4.0, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.plumeImage.frame = CGRect(x: self.view.frame.width / 2 , y: self.perlaImage.frame.origin.y , width: 100, height: 200)
            self.plumeImage.alpha = 0
        })
        
    }
    
    @IBAction func onReflectionFinished(_ sender: UIButton) {
        reflectionDelegate.onReflectionFinished()
    }
}
