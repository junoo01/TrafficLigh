//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by Apple on 26/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trafficLight: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var btnStartStop: UIButton!
    
    var timer = Timer()
    var scoreTimer = Timer()
    var timerCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       counterLabel.text = String(timerCount);
    }

    @IBAction func startStopClicked(_ sender: Any) {
        if timerCount == 0 {
            timerCount = 10;
            trafficLight.image = UIImage(named: "TrafficLight")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
            btnStartStop.isEnabled = false;
            btnStartStop.setTitle("", for: [])

        
            counterLabel.text = String(timerCount);
        }
        else{

            scoreTimer.invalidate();
        }

    }
    
    @objc func updateCounter() {
        timerCount -= 1
        if timerCount == 9 {
            trafficLight.image = UIImage(named: "TrafficLight3")

        }else if timerCount == 6 {
            trafficLight.image = UIImage(named: "TrafficLight2");
            btnStartStop.setTitle("Stop", for: [])
        }else if timerCount == 5 {
            trafficLight.image = UIImage(named: "TrafficLight1");
            btnStartStop.isEnabled = true
            if timerCount == 0 {
                timer.invalidate()
            }
        }
        counterLabel.text = String(timerCount);
    }
    
    
}

