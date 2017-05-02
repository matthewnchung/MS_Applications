//
//  MainVC.swift
//  NIH_App
//
//  Created by Matthew Chung on 3/24/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import QuartzCore

class MainVC: UIViewController {

    @IBOutlet weak var tapCounterLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var rightHandButton: UIButton!
    @IBOutlet weak var leftHandButton: UIButton!
    @IBOutlet weak var tapHereLabel: UIButton!
    @IBOutlet weak var DirectionsUIVIew: UIView!
    
    var timeLeft = 10 //If you change this reset the time in updateTime()
    var timer = Timer()
    var tapsCount = Int()
    static private var hand = ""
    static private var average = 0
    static private var count = 0
    static private var scores = [0,0,0]
    
    // INCLUDE IN ALL VCs WHERE YOU WANT THE NAVIGATION BAR TO DISAPPEAR
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.isNavigationBarHidden = true;
    }*/
    
    @IBAction func rightHandButton(_ sender: UIButton) {
        rightHandButton.isHidden = true
        leftHandButton.isHidden = true
        timerLabel.isHidden = false
        tapCounterLabel.isHidden = false
        startButton.isHidden = false
        MainVC.hand = "Right"
    }
    @IBAction func leftHandButton(_ sender: UIButton) {
        rightHandButton.isHidden = true
        leftHandButton.isHidden = true
        timerLabel.isHidden = false
        tapCounterLabel.isHidden = false
        startButton.isHidden = false
        MainVC.hand = "Left"
    }
    
    @IBAction func beginPressed(_ sender: Any) {
        DirectionsUIVIew.isHidden = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ADD THESE THREE THINGS IN EVERY TEST CLASS
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Tap Test"
        
        //Remove this if you want to see count
        //tapCounterLabel.isHidden = true
        tapHereLabel.isHidden = true;
        
        // Do any additional setup after loading the view, typically from a nib.
        if MainVC.count == 0 {
            timerLabel.isHidden = true
            tapCounterLabel.isHidden = true
            startButton.isHidden = true
        } else {
            rightHandButton.isHidden = true
            leftHandButton.isHidden = true
            DirectionsUIVIew.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Final: FinalScreenVC = segue.destination as! FinalScreenVC
        if MainVC.count == 3 {
            MainVC.average = (MainVC.scores[0]+MainVC.scores[1]+MainVC.scores[2])/3
            Final.receivedScore = "Trial 1: \(MainVC.scores[0])\nTrial 2: \(MainVC.scores[1])\nTrial 3: \(MainVC.scores[2])\nFinal: \(MainVC.average)"
            Final.receivedHand = MainVC.hand
            MainVC.count = 0
            MainVC.average = 0
        } else {
            Final.receivedScore = "\(tapsCount)"
            Final.receivedHand = MainVC.hand
        }
        
    }
    
    @IBAction func startAction(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MainVC.updateTimer), userInfo: nil, repeats: true)
        startButton.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let colors = [UIColor.white,UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)]
        if timeLeft >= 0 && timeLeft != 10 {
            tapsCount += 1
            self.view.backgroundColor = colors[tapsCount%2]
            
            // uncomment to show score updating on tap
            // tapCounterLabel.text = "\(tapsCount)"
        }
    }
    
    func updateTimer() {
        timeLeft -= 1
        timerLabel.text = "\(timeLeft)"
        
        if timeLeft == 0 {
            timer.invalidate()
            if MainVC.count == 3 {
                performSegue(withIdentifier: "toFinalScreen", sender: nil)
            } else {
                MainVC.scores[MainVC.count] = tapsCount
                MainVC.count+=1
                performSegue(withIdentifier: "toFinalScreen", sender: nil)
            }
        }
    }
}
