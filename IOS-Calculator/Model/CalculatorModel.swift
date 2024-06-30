//
//  CalculatorModel.swift
//  IOS-Calculator
//
//  Created by Bholanath Barik on 29/06/24.
//

import Foundation

enum calculatorOperation {
    case none, add, subtract, multiply, divide
}

struct CalculatorModel {
    var display = "0";
    var currentNumber: Double = 0;
    var previousNumber: Double = 0;
    var operation: calculatorOperation = .none;
    var performingOperation = false
}
