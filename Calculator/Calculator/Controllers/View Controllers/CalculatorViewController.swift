//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Aaron Prestidge on 4/6/20.
//  Copyright © 2020 AaronPrestidge. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - Properties
//    static var isWaitEnabled: Bool! = false
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tapeLabel: UILabel!
    private var firstNumber: Double = 0.0
    private var symbol: String = ""
    private var isSymbolPressed: Bool = false
//    var settings: SettingsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func pressNumber(_ sender: UIButton) {
        guard let tapeLabel = tapeLabel else {return}
        let buttonText = sender.titleLabel?.text!
        let labelText = resultLabel.text!
        if buttonText == "." && labelText.contains(".") {
            return
        }
        if isSymbolPressed {
            resultLabel.text = buttonText
            isSymbolPressed = false
            tapeLabel.text = "\(symbol)"
//            tapeLabel.text? += String(describing: buttonText)
//            print(tapeLabel.text ?? "")
            return
        }
        resultLabel.text =
            "\((Double(labelText) != 0.0 || labelText.contains(".") || buttonText == ".") ? labelText : "")" +
        "\(buttonText!)"
    }
    
    @IBAction func pressSymbol(_ sender: UIButton) {
        firstNumber = Double(resultLabel.text!)!
        symbol = (sender.titleLabel?.text)!
        isSymbolPressed = true
//        tapeLabel.text = "\(firstNumber)\(symbol)"
    }
    
    @IBAction func pressReset(_ sender: UIButton) {
//        wait()
        resultLabel.text = String(0)
        firstNumber = 0.0
        symbol = ""
        isSymbolPressed = false
        tapeLabel.text = "Cleared"
    }
    
    @IBAction func pressCalculate(_ sender: UIButton) {
        let secondNumber = Double(resultLabel.text!)!
        let result = calculate(secondNumber)
        let resultText = "\(firstNumber)\(symbol)\(secondNumber) = \(result)"
//        wait()
        resultLabel.text = String(result)
        firstNumber = 0.0
        symbol = ""
        isSymbolPressed = true
        tapeLabel.text = resultText
        print(resultText)
    }
    
    private func calculate(_ secondNumber: Double) -> Double {
        switch symbol {
        case "+": return firstNumber + secondNumber
        case "-": return firstNumber - secondNumber
        case "*": return firstNumber * secondNumber
        case "/": return firstNumber / secondNumber
        default: return Double(resultLabel.text!)!
        }
    }
    
//    private func wait() {
//        if UserDefaults.standard.bool(forKey: "enableWaits") {
//            sleep(2)
//        }
//    }
    }//End Class
