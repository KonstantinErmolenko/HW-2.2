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
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var redValueField: UITextField!
    
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenValueField: UITextField!
    
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueValueField: UITextField!
        
    private var redComponent: CGFloat = CGFloat(1.0)
    private var greenComponent: CGFloat = CGFloat(1.0)
    private var blueComponent: CGFloat = CGFloat(1.0)
    private var alphaValue: CGFloat = CGFloat(1.0)
    
    let numberFormatter = NumberFormatter()
    
    fileprivate func setInitialComponentValues() {
        var textValue = numberFormatter.string(from: NSNumber(value: redSlider.value))
        redValueLabel.text = textValue
        redValueField.text = textValue
        
        textValue = numberFormatter.string(from: NSNumber(value: greenSlider.value))
        greenValueLabel.text = textValue
        greenValueField.text = textValue
        
        textValue = numberFormatter.string(from: NSNumber(value: blueSlider.value))
        blueValueLabel.text = textValue
        blueValueField.text = textValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        setInitialComponentValues()
    }

    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 15
        setViewColor()
    }
    
    func setViewColor() {
        colorView.backgroundColor = UIColor(red: redComponent, green: greenComponent, blue: blueComponent, alpha: alphaValue)
    }
    
    @IBAction func redSliderChanged() {
        redSlider.value = getRoundedValue(redSlider.value)
        redComponent = CGFloat(redSlider.value)
        
        let textValue = numberFormatter.string(from: NSNumber(value: redSlider.value))
        redValueLabel.text = textValue
        redValueField.text = textValue
        
        setViewColor()
    }
    
    @IBAction func greenSliderChanged() {
        greenSlider.value = getRoundedValue(greenSlider.value)
        greenValueLabel.text = numberFormatter.string(from: NSNumber(value: greenSlider.value))
        
        greenComponent = CGFloat(greenSlider.value)
        setViewColor()
    }
    
    @IBAction func blueSliderChanged() {
        blueSlider.value = getRoundedValue(blueSlider.value)
        blueValueLabel.text = numberFormatter.string(from: NSNumber(value: blueSlider.value))
        
        blueComponent = CGFloat(blueSlider.value)
        setViewColor()
    }
    
    func getRoundedValue(_ value: Float) -> Float {
        return (value * 100).rounded() / 100
    }
}

