//
//  ReflexMainVC.swift
//  NIH_App
//
//  Created by Matthew Chung on 3/25/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import QuartzCore

class ReflexMainVC: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var bubbleButton: UIButton!
    var count = 0;
    var time = 0;
    var timer = Timer()
    
    var startTime: TimeInterval = 0
    var endTime: TimeInterval = 0
    var sumTime = 0.0
    var temp = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ADD THESE THREE THINGS IN EVERY TEST CLASS
        /*let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Reflex Test"*/
       self.navigationController?.setNavigationBarHidden(true, animated: true)

        
        bubbleButton.isHidden = true
    }
    
    @IBAction func onStartButtonPressed(_ sender: UIButton) {
        startButton.isHidden = true
        bubbleButton.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ReflexMainVC.updateTimer), userInfo: nil, repeats: true)
        moveButton()
    }
    
    @IBAction func onBubblePress(_ sender: UIButton) {
        moveButton()
        count+=1
        if (count == 20) {
            bubbleButton.isHidden = true
            performSegue(withIdentifier: "toFinalScreen", sender: nil)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    func moveButton () {
        endTime = NSDate().timeIntervalSinceReferenceDate
        temp = (endTime - startTime)
        if (temp < 10) {
            sumTime += temp
        }
        startTime = NSDate().timeIntervalSinceReferenceDate
        bubbleButton.setImage(#imageLiteral(resourceName: "blueBubble"), for: .normal)
        let Xcoor:UInt32 = arc4random_uniform(UInt32(self.view.frame.width-50))
        let Ycoor:UInt32 = arc4random_uniform(UInt32(self.view.frame.height-50))
        bubbleButton.frame = CGRect(x: CGFloat(Xcoor), y: CGFloat(Ycoor), width: 50, height: 50)
        self.view.addSubview(bubbleButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let FinalScreenVC: FinalReflexVC = segue.destination as! FinalReflexVC
        FinalScreenVC.finalTime = "\(time)"
        let index = "\(sumTime/20)".index("\(sumTime/20)".startIndex, offsetBy: 4)
        FinalScreenVC.reactionTime = "\(sumTime/20)".substring(to: index)
    }
    
    func updateTimer() {
        time += 1
    }
}

