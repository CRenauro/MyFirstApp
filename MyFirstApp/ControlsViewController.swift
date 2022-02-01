//
//  ControlsViewController.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 1/21/22.
//

import UIKit

// Text Field, Gallery Image View, Slider, Segment, Image Picker,
// Switch, Motion Shake

class ControlsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    var picker = UIImagePickerController()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBAction func onOff(_ sender: UISwitch) {
        if (sender.isOn == true){
            clickButton.isEnabled = true
        } else {
            clickButton.isEnabled = false
        }
    }
    
    
    @IBOutlet weak var clickButton: UIButton!
    
    @IBAction func slider(_ sender: UISlider) {
    }
    var initialFrame, finalFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "updated from code"
        // Do any additional setup after loading the view.
        emailTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initialFrame = self.view.frame
        finalFrame = self.view.frame
        finalFrame!.origin.y -= 300
    }
    
    
    @IBOutlet var colorSlider: [UISlider]!
    
    @IBAction func updateText(_ sender: UIButton) {
        welcomeLabel.text = "button clicked"
    }
    
    @IBAction func colorSliderChanged (_ sender: UISlider){
        self.view.backgroundColor = UIColor.init(_colorLiteralRed: colorSlider[0].value, green: colorSlider[1].value, blue: colorSlider[2].value, alpha: 1.0)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider)
    {
        welcomeLabel.text = "\(sender.value)"
    }


    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender .selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = UIColor.red
        
        case 1:
        self.view.backgroundColor = UIColor.green
        
        case 2:
        self.view.backgroundColor = UIColor.blue
        
        case 3:
        self.view.backgroundColor = UIColor.white
        
        default:break
        }
    }
    
    

    
    @IBAction func getImage(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            picker.sourceType = .camera
        } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
        }
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
           
    }
    
    
    //methods are optional
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //outlet connected to image view
        galleryImageView.image = info[.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3){
            self.view.frame = self.finalFrame!
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = self.initialFrame!
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) { //only works for one layer
        for view in self.view.subviews
        {
            if view.isKind(of: UITextField.self)
            {
                view.resignFirstResponder()
            }
        }
    }
    
    
    // ex. if phone gets dropped / user shakes device / abrupt motion / detects motion of accelerator
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(motion == .motionShake)
        {
            self.view.backgroundColor = UIColor.red
        }
    }
}
