//
//  CalculatorViewModel.swift
//  IOS-Calculator
//
//  Created by Bholanath Barik on 29/06/24.
//

import Foundation

class CalculatorViewModel : ObservableObject {
    @Published var model = CalculatorModel();
    
    func buttonTapped(button :String) {
        if let _ = Double(button) {
            if model.performingOperation {
                model.display = button;
                model.performingOperation = false;
            }else {
                if model.display == "0" {
                    model.display = button;
                } else {
                    model.display += button;
                }
            }
            model.currentNumber = Double(model.display) ?? 0;
        } else if button == "." {
            if !model.display.contains(".") {
                model.display += ".";
            }
        } else if button == "=" {
            performOperation()
        }else if button == "AC" {
            clearCalculation();
        }
        else {
            model.operation = getOperation(for: button);
            model.previousNumber = model.currentNumber;
            model.performingOperation = true;
        }
    }
    
    func performOperation() {
        switch model.operation {
        case .add:
            model.display = "\(model.previousNumber + model.currentNumber)"
        case .subtract:
            model.display = "\(model.previousNumber - model.currentNumber)"
        case .multiply:
            model.display = "\(model.previousNumber * model.currentNumber)"
        case .divide:
            model.display = "\(model.previousNumber / model.currentNumber)"
        default :
            model.display = "0";
        }
    }
    
    func clearCalculation() {
        model.currentNumber = 0;
        model.previousNumber = 0;
        model.display = "0"
        model.operation = .none
    }
    
    func getOperation(for button: String) -> calculatorOperation {
        switch button {
        case "+":
            return .add
        case "-":
            return .subtract
        case "×":
            return .multiply
        case "÷":
            return .divide
        default :
            return .none
        }
    }
}
