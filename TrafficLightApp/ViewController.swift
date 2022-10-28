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
    
    var timer: Timer?
    let timeGreen = 7
    let timeYellow = 3
    let timeRed = 5
    var isRun = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turnOfAll()
        setUpTimerGreend()
    }
    
    func turnOfAll() {
        trafficLight.image = UIImage(named: "TrafficLight")
    }
    
    func setUpTimerGreend() {
        var number = timeGreen
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.turnOfAll()
            self.trafficLight.image = UIImage(named: "TrafficLight1")
            number -= 1
            self.counterLabel.text = String(number);
            if number <= 0 {
                self.isRun = false
                self.timer?.invalidate()
                self.setUpTimerYellow()
            }
        })
    }
    
    func setUpTimerYellow() {
        var number = timeYellow
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.turnOfAll()
            self.trafficLight.image = UIImage(named: "TrafficLight2")
            number -= 1
            self.counterLabel.text = String(number);
            if number <= 0 {
                self.isRun = false
                self.timer?.invalidate()
                self.setUpTimerRed()
            }
        })
    }
    func setUpTimerRed() {
        var number = timeYellow
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.turnOfAll()
            self.trafficLight.image = UIImage(named: "TrafficLight3")
            number -= 1
            self.counterLabel.text = String(number);
            if number <= 0 {
                self.isRun = false
                self.timer?.invalidate()
                self.setUpTimerGreend()()
            }
        })
    }
    

}

