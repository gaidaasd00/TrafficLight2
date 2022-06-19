//
//  ViewController.swift
//  TrafficLight2
//
//  Created by Алексей Гайдуков on 19.06.2022.
//


import UIKit

enum CurrenLight {
    case red, yellow, green
}

class ViewController: UIViewController {
   
    @IBOutlet var stackLable: UIStackView!
    @IBOutlet var redLable: UIView!
    @IBOutlet var yellowLable: UIView!
    @IBOutlet var greenLable: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrenLight.red
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLable.alpha = lightOff
        yellowLable.alpha = lightOff
        greenLable.alpha = lightOff
        
        startButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        stackLable.layer.cornerRadius = stackLable.frame.width / 2
    }

    @IBAction func startButtonTapped() {
        startButton.setTitle(redLable.isHidden ? "START" : "NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            redLable.alpha = lightOn
            greenLable.alpha = lightOff
            currentLight = .yellow
        case .yellow:
            redLable.alpha = lightOff
            yellowLable.alpha = lightOn
            currentLight = .green
        case .green:
            yellowLable.alpha = lightOff
            greenLable.alpha = lightOn
            currentLight = .red
        }
    }
    
}

