//
//  ViewController.swift
//  BullsEye
//
//  Created by ErnestG on 30/06/2019.
//  Copyright © 2019 EG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50;
    var targetValue  = 0;
    var score = 0;
    var round = 0;
    
    @IBOutlet weak var slider: UISlider!;
    @IBOutlet weak var target: UILabel!;
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded();
        currentValue = Int(roundedValue);
        targetValue = Int.random(in: 1...100);
        startNewGame();
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal");
        slider.setThumbImage(thumbImageNormal, for: .normal);

        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted");
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted);
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14);
        
        let leftImage = #imageLiteral(resourceName: "SliderTrackLeft");
        slider.setMinimumTrackImage(leftImage.resizableImage(withCapInsets: insets), for: .normal);
        
        let rightImage = #imageLiteral(resourceName: "SliderTrackRight");
        slider.setMaximumTrackImage(rightImage.resizableImage(withCapInsets: insets), for: .normal);
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue);
        var points = 100 - difference;
        score += points;
        let title: String;
        if difference == 0 {
            title = "Perfect 👌🏻 you got a BONUS!";
            score += 100;
            points += 100;
        } else if difference == 1 {
            title = "Perfect 👌🏻 you got a BONUS!";
            score += 50;
            points += 50;
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        scoreLabel.text = String(score);
        roundLabel.text = String(round);
        let message = "You scored \(points) points";
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        });
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
    }
    
    @IBAction func slider(_ slider: UISlider) {
        let roundedValue = slider.value.rounded();
        print("The value of the slider is now: \(roundedValue)");
        currentValue = Int(roundedValue);
    }
    
    @IBAction func startNewGame() {
        score = 0;
        round = 0;
        startNewRound();
    }
    
    func startNewRound() {
        round += 1;
        targetValue = Int.random(in: 1...100);
        print(targetValue);
        currentValue = 50;
        slider.value = Float(currentValue);
        updateLabels();
    }
    
    func updateLabels() {
        target.text = String(targetValue);
        scoreLabel.text = String(score);
        roundLabel.text = String(round);
    }
    
}
