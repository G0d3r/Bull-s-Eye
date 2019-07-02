//
//  ViewController.swift
//  BullsEye
//
//  Created by ErnestG on 30/06/2019.
//  Copyright © 2019 EG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 50;
    var targetValue: Int = 0;
    
    @IBOutlet weak var slider: UISlider!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded();
        currentValue = Int(roundedValue);
        targetValue = Int.random(in: 1...100);
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue)\nThe target value is \(targetValue)";
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
    }

    @IBAction func slider(_ slider: UISlider) {
        let roundedValue = slider.value.rounded();
        print("The value of the slider is now: \(roundedValue)");
        currentValue = Int(roundedValue);
    }
    
    func startNewValue() {
        targetValue = Int.random(in: 1...100);
        
    }

}

