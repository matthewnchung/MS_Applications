//
//  FinalReflexVC.swift
//  NIH_App
//
//  Created by Matthew Chung on 3/25/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class FinalReflexVC: UIViewController {

    @IBOutlet weak var finalTimeLabel: UILabel!
    @IBOutlet weak var reactionTimeLabel: UILabel!
    var finalTime = "";
    var reactionTime = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ADD THESE THREE THINGS IN EVERY TEST CLASS
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Reflex Test"
        
        finalTimeLabel.text = finalTime
        reactionTimeLabel.text = reactionTime
    }

}
