//
//  ViewController.swift
//  CalculatorLab
//
//  Created by Wesley Keetch on 9/4/24.
//

import UIKit

var currentNumber: Double = 0
var previousNumber: Double = 0
var performingOperation: Bool = false
var operation = 0

class ViewController: UIViewController {
  
  @IBOutlet weak var resultLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func numberButtonPressed(_ sender: UIButton) {
    if performingOperation == true {
      resultLabel.text = String(sender.tag)
      currentNumber = Double(resultLabel.text!)!
      performingOperation = false
    } else {
      resultLabel.text = resultLabel.text! + String(sender.tag)
      currentNumber = Double(resultLabel.text!)!
      print("\(sender.tag) button pressed")
    }
  }
  
  @IBAction func operationPressed(_ sender: UIButton) {
    if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
      previousNumber = Double(resultLabel.text!)!
      if sender.tag == 12 {
        resultLabel.text = "/"
      } else if sender.tag == 13 {
        resultLabel.text = "×"
      } else if sender.tag == 14 {
        resultLabel.text = "-"
      } else if sender.tag == 15 {
        resultLabel.text = "+"
      }
      operation = sender.tag
      performingOperation = true
    } else if sender.tag == 16 {
      if operation == 12 {
        resultLabel.text = String(previousNumber / currentNumber)
      } else if operation == 13 {
        resultLabel.text = String(previousNumber * currentNumber)
      } else if operation == 14 {
        resultLabel.text = String(previousNumber - currentNumber)
      } else if operation == 15 {
        resultLabel.text = String(previousNumber + currentNumber)
      }
    } else if sender.tag == 11 {
      resultLabel.text = ""
      previousNumber = 0
      currentNumber = 0
      operation = 0
    }
  }
  
  @IBAction func equalsPressed(_ sender: UIButton) {
    if operation == 12 {
      resultLabel.text = String(previousNumber / currentNumber)
    } else if operation == 13 {
      resultLabel.text = String(previousNumber * currentNumber)
    } else if operation == 14 {
      resultLabel.text = String(previousNumber - currentNumber)
    } else if operation == 15 {
      resultLabel.text = String(previousNumber + currentNumber)
    }
  }
  
  @IBAction func clearButtonPressed(_ sender: UIButton) {
    resultLabel.text = ""
    previousNumber = 0
    currentNumber = 0
    operation = 0
  }
  
}

