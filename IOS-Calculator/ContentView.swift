//
//  ContentView.swift
//  IOS-Calculator
//
//  Created by Bholanath Barik on 29/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel();
    
    let buttons: [String] = [
        "7", "8", "9", "÷",
        "4", "5", "6", "×",
        "1", "2", "3", "-",
        "0", ".", "=", "+",
    ]
    
    let colume : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                Text(viewModel.model.display)
                    .font(.largeTitle)
                    .padding()
            }
            
            Spacer()
            LazyVGrid(columns: colume){
                ForEach(buttons, id: \.self) { buttons in
                    Button (action: {
                        viewModel.buttonTapped(button: buttons)
                    }){
                       Text(buttons)
                            .font(.title)
                            .frame(width: buttonWidth(button: buttons), 
                                   height: buttonHeight())
                            .background(isNumber(button: buttons) ? Color.gray : Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                }
            }
            Button(action: {
                viewModel.buttonTapped(button: "AC")
            }) {
                Text("AC")
                    .font(.title)
                    .frame(width: 370,
                           height: (UIScreen.main.bounds.width - 5 * 12) / 6)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            .padding()
        }
        .padding()
    }
    
    func buttonWidth(button: String) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4;
    }
    
    func isNumber(button : String) -> Bool {
        return Double(button) != nil && button != "0";
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4;
    }
}

#Preview {
    ContentView()
}
