//
//  HomescreenVC.swift
//  NIH_App
//
//  Created by Matthew Chung on 3/24/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class HomescreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // continue to add tests here. tests array is for the actual names and images is for the image file in assets
    var tests = ["Tap Test","Trace Test","Reflex Test"]
    var images = [UIImage(named: "tappingFinger"), UIImage(named: "spiral"), UIImage(named: "FingerTapping")]
    var segues = ["toTapTest","toTraceTest","toReflexTest"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TO HIDE THE BACK BUTTON ON HOME SCREEN
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        // Boilerplate code needed for the navigation controller header
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black // I then set the color using:
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.82, green: 0.05, blue: 0.00, alpha: 1.0) // a lovely red
        self.navigationController?.navigationBar.tintColor = UIColor.white // for titles, buttons, etc.
        let navigationTitleFont = UIFont(name: "Avenir", size: 22)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navigationTitleFont]
    }
    
    // MUST INCLUDE IN ALL CLASSES WHERE THE NAVIGATION BAR IS WATED
    /*override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.isNavigationBarHidden = false;
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! TestCell
        cell.testImage.image = images[indexPath.row]
        cell.testLabel.text = tests[indexPath.row]

        return cell
    }
    
    // method runs when cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        // Segue to the second view controller
        self.performSegue(withIdentifier: segues[indexPath.row], sender: self)
    }
    
}

