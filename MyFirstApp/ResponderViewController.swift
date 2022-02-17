//
//  ResponderViewController.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 1/26/22.
//

import UIKit

// Responder Chain, Stepper, Login Action(pin)

class ResponderViewController: UIViewController {


    @IBOutlet weak var callNumberLabel: UILabel!
    
    
    @IBOutlet weak var stepperLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let relogin =
        UIAlertController(title: "login", message: "timed out", preferredStyle: .alert)
        
        
        relogin.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        //action sheets cannot have input fields!
        
        let loginAction = UIAlertAction(title: "login", style: .default) {
            (action) in
            //try server login
            print(relogin.textFields! [0].text)
        }
        
        relogin.addAction(loginAction)
        self.present(relogin, animated: true, completion: nil)
    }
    

 
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepperLabel.text = "\(sender.value)"
        
    }
    
    @IBAction func greenAction(_ sender: Any) {
        print("green clicked")
    }
    
    @IBAction func blue(_ sender: Any) {
        print("blue clicked")
    }
    
   
    @IBAction func callThisNumber(_ sender: Any) {
        if let telURL = URL(string: "tel://"+callNumberLabel.text!),
           UIApplication.shared.canOpenURL(telURL)
        {
            UIApplication.shared.open(telURL, options: [:], completionHandler: nil)
        }
    }
    
}
