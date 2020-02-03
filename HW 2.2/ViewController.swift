//
//  ViewController.swift
//  HW 2.2
//
//  Created by Ермоленко Константин on 02.02.2020.
//  Copyright © 2020 Ермоленко Константин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB
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
        
        redValueField.delegate = self
        greenValueField.delegate = self
        blueValueField.delegate = self
    }
    
    func setupTextFields() {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        redValueField.inputAccessoryView = toolbar
        greenValueField.inputAccessoryView = toolbar
        blueValueField.inputAccessoryView = toolbar
    }

    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 15
        setViewColor()
        setupTextFields()
    }
    
    func setViewColor() {
        colorView.backgroundColor = UIColor(red: redComponent, green: greenComponent, blue: blueComponent, alpha: CGFloat(1.0))
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
        greenComponent = CGFloat(greenSlider.value)
        
        let textValue = numberFormatter.string(from: NSNumber(value: greenSlider.value))
        greenValueLabel.text = textValue
        greenValueField.text = textValue
        
        setViewColor()
    }
    
    @IBAction func blueSliderChanged() {
        blueSlider.value = getRoundedValue(blueSlider.value)
        blueComponent = CGFloat(blueSlider.value)
        
        let textValue = numberFormatter.string(from: NSNumber(value: blueSlider.value))
        blueValueLabel.text = textValue
        blueValueField.text = textValue
        
        setViewColor()
    }
    
    func getRoundedValue(_ value: Float) -> Float {
        return (value * 100).rounded() / 100
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let textValue = textField.text else { return }
        
        var decimalValue = (textValue as NSString).floatValue
        decimalValue = decimalValue <= 1.0 ? getRoundedValue(decimalValue) : 1.0
        
        let labelText = numberFormatter.string(from: NSNumber(value: decimalValue))
        
        if textField == redValueField {
            redComponent = CGFloat(decimalValue)
            redSlider.value = decimalValue
            redValueLabel.text = labelText
        } else if textField == greenValueField {
            greenComponent = CGFloat(decimalValue)
            greenSlider.value = decimalValue
            greenValueLabel.text = labelText
        } else if textField == blueValueField {
            greenComponent = CGFloat(decimalValue)
            greenSlider.value = decimalValue
            greenValueLabel.text = labelText
        }
        setViewColor()
    }
}

