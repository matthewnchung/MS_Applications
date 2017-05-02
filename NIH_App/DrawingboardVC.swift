//
//  DrawingboardVC.swift
//  NIH_App
//
//  Created by Matthew Chung on 3/25/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import MessageUI

class DrawingboardVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var lastPoint = CGPoint.zero
    var swiped = false
    var username = "Matthew Chung"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ADD THESE THREE THINGS IN EVERY TEST CLASS
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Trace Test"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).cgColor)
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawLines(fromPoint: lastPoint, toPoint: lastPoint)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        self.imageView.image = nil
    }
    
    func showMailComposerWith(attachmentURL: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self;
            mail.setCcRecipients(["matthewnchung@gmail.com"])
            mail.setSubject("\(username.capitalized) results for Trace Test")
            mail.setMessageBody("Attached below are \(username.capitalized)'s results for the Tracing Test.", isHTML: false)
            let imageData: NSData = UIImagePNGRepresentation(imageView.image!)! as NSData
            mail.addAttachmentData(imageData as Data, mimeType: "image/png", fileName: "imageName")
            self.present(mail, animated: true, completion: nil)
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        let top: CGFloat = 150
        let bottom: CGFloat = 150
        let size = CGSize(width: view.frame.size.width, height: view.frame.size.height - top - bottom)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: -top)
        view.layer.render(in: context)
        let snapshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(snapshot!, nil, nil, nil)
        
        //showMailComposerWith(attachmentURL: "snapshot")
    }
    
}
