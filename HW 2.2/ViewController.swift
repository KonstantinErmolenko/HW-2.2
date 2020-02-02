//
//  ViewController.swift
//  HW 2.2
//
//  Created by Ермоленко Константин on 02.02.2020.
//  Copyright © 2020 Ермоленко Константин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var redValue: UITextField!
    @IBOutlet var redSlider: UISlider!
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        redValueLabel.text = numberFormatter.string(from: NSNumber(value: redSlider.value))
        
    }

    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 10
    }
    
    @IBAction func redSliderAction() {
        redSlider.value = (redSlider.value * 100).rounded() / 100
        redValueLabel.text = numberFormatter.string(from: NSNumber(value: redSlider.value))
    }
    
    
    
}

