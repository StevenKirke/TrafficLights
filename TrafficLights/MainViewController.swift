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
    
    // ослеживаем поворот экрана
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        roundingElements(blockView: blockIndecatorsView)
    }

    // отслеживаем нажатие кнопки
    @IBAction func ChangeColorActionButon() {
        stepClickButton += 1
        if stepClickButton == blockIndecatorsView.count + 1 {
            stepClickButton = 1
        }
        
        changeColor(blockView: blockIndecatorsView, step: stepClickButton)
    }

    // применяем скругление элементов массива View
    func roundingElements(blockView: [UIView]?) {
        guard let blockView = blockView else { return }
        blockView.forEach { elem in
            elem.layer.cornerRadius = elem.bounds.height / 2
        }
    }
    
    // меняем прозрачность элементов View после нажатия кнопки
    func changeColor(blockView: [UIView]?, step: Int) {
        guard let blockView = blockView else { return }
        blockView.forEach { elem in
            elem.alpha = 0.3
            elem.layer.shadowOpacity = 0.0
        }
        
        let elemView = blockView[step - 1]
        elemView.alpha = 1
        
        shadowLight(blockView: elemView)
    }
    
    // прорисовка тени
    func shadowLight(blockView: UIView?) {
        guard let elem = blockView else { return }
        elem.layer.shadowColor = blockView?.backgroundColor?.cgColor
        elem.layer.shadowRadius = 5
        elem.layer.shadowOpacity = 1
        elem.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

