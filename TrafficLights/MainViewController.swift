//
//  MainViewController.swift
//  TrafficLights
//
//  Created by Steven Kirke on 19.08.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var stepClickButton = 0

    @IBOutlet var blockIndecatorsView: [UIView]!
    @IBOutlet weak var ChangeColorButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChangeColorButton.layer.cornerRadius = 10
        roundingElements(blockView: blockIndecatorsView)

    }

    @IBAction func ChangeColorActionButon() {
        stepClickButton += 1
        if stepClickButton == blockIndecatorsView.count + 1 {
            stepClickButton = 1
        }
        print(stepClickButton)
        changeColor(blockView: blockIndecatorsView, step: stepClickButton)
    }

    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        getScreenSize()
    }
    
    func getScreenSize() {
        roundingElements(blockView: blockIndecatorsView)
    }
    
    func roundingElements(blockView: [UIView]) {
        blockView.forEach { elem in
            elem.layer.cornerRadius = elem.bounds.height / 2
        }
    }
    
    func changeColor(blockView: [UIView], step: Int) {
        blockView.forEach { (elem) in
            elem.alpha = 0.3
        }
        blockView[step - 1].alpha = 1
    }
}


