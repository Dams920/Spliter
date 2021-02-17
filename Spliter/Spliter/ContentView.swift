//
//  ContentView.swift
//  Spliter
//
//  Created by Damien Chailloleau on 16/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var price: String = ""
    @State private var numberOfPeople = ""
    @State private var percentSelected = 2
    
    let tipPercentage = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peoples = Int(numberOfPeople) ?? 0
        let peopleCount = Double(peoples)
        let tipSelection = Double(tipPercentage[percentSelected])
        let amount = Double(price) ?? 0
        
        let value = amount / 100 * tipSelection
        let total = amount + value
        let amountPerPerson = total / peopleCount
        return amountPerPerson
    }
    
    var checkAmount: Double {
        let tipSelection = Double(tipPercentage[percentSelected])
        let amount = Double(price) ?? 0
        
        let value = amount / 100 * tipSelection
        let total = amount + value
        return total
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the amount :", text: $price)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of Peoples:", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                
                Section(header: Text("How much tip do you want to leave ?")) {
                    Picker("Select Tip Percentages:", selection: $percentSelected) {
                        ForEach(0 ..< tipPercentage.count) {
                            Text("\(self.tipPercentage[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Amount")) {
                    Text("\(checkAmount, specifier: "%.2f") €")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f") €")
                }
            }
            .navigationBarTitle("Spliter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
