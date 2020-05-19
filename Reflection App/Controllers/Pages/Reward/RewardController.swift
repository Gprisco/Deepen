//
//  RewardController.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 13/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class RewardController: UIViewController {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet weak var perlaImage: UIImageView!
    @IBOutlet weak var textViewReward: UITextView!
    @IBOutlet weak var labelReward: UILabel!
    @IBOutlet weak var plumeImage: UIImageView!
    
    
    var imageName: String!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundImage.image = UIImage(named: self.imageName)
        
        plumeAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func plumeAnimation()  {

        UIView.animate(withDuration: 4.0, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.plumeImage.frame = CGRect(x: self.view.frame.width / 2 , y: self.perlaImage.frame.origin.y , width: 100, height: 200)
            self.plumeImage.alpha = 0
        })
        
    }

}
