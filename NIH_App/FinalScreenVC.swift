//
//  FinalScreenVC.swift
//  NIH_App
//
//  Created by Matthew Chung on 3/24/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import MessageUI

class FinalScreenVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var mailSublabel: UILabel!
    @IBOutlet weak var mailLabel: UIButton!
    @IBOutlet weak var restartLabel: UIButton!
    @IBOutlet weak var trialNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var handLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    var receivedScore = ""
    var receivedHand = ""
    var username = "Matthew Chung"
    static private var trialNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ADD THESE THREE THINGS IN EVERY TEST CLASS
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Tap Test"
        
        handLabel.text = "(\(receivedHand) Hand)"
        mailLabel.isHidden = true
        mailSublabel.isHidden = true
        homeButton.isHidden = true
        if FinalScreenVC.trialNumber != 3 {
            self.view.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 190/255, alpha: 1)
            scoreLabel.text = "\(receivedScore)"
            trialNumberLabel.text = "Trial \(FinalScreenVC.trialNumber)"
            FinalScreenVC.trialNumber += 1
        } else {
            self.view.backgroundColor = UIColor(red: 180/255, green: 195/255, blue: 255/255, alpha: 1)
            restartLabel.setTitle("Restart?", for: UIControlState.normal)
            mailLabel.isHidden = false
            mailSublabel.isHidden = false
            restartLabel.isHidden = true
            homeButton.isHidden = false
            scoreLabel.font = scoreLabel.font.withSize(35)
            scoreLabel.text = "\(receivedScore)"
            trialNumberLabel.text = "Final Results"
            FinalScreenVC.trialNumber = 1
        }
        
    }
    
    @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
        let mailComposeController = MFMailComposeViewController()
        mailComposeController.mailComposeDelegate = self
        mailComposeController.setToRecipients(["matthewnchung@gmail.com"])
        mailComposeController.setSubject("\(username.capitalized) Tapping Game Results")
        mailComposeController.setMessageBody("\(username.capitalized) scored \(receivedScore) taps with their \(receivedHand) hand.", isHTML: false)
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeController, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
