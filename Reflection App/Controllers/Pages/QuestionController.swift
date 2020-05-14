//
//  Page.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 13/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class QuestionController: UIViewController{

    
    @IBOutlet var backgroundImage: UIImageView!
    var imageName: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundImage.image = UIImage(named: self.imageName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

}
