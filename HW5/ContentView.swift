//
//  ContentView.swift
//  HW5
//
//  Created by Данил Менделев on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var stringForSuffixArray: String = ""
    @State private var suffixArray = [Int]()
    @State private var outsideStr = ""
    
    var body: some View {
        
        let lowercase = Binding<String>(get: {
                   self.stringForSuffixArray
               }, set: {
                   self.stringForSuffixArray = $0.lowercased()
               })
        NavigationView {
            VStack {
                Text("Find suffix array")
                    .padding()
                Spacer()
                TextField("Inside your string this-> ", text: lowercase)
                    .padding()


                Button("Find index suffix") {
                    suffixArray = SuffixArray(insideString: stringForSuffixArray).arrayP
                    outsideStr = stringForSuffixArray
                    stringForSuffixArray = suffixArray.description
                }
                .padding()
                
                if !suffixArray.isEmpty {
                    NavigationLink (destination: StatisticView(arraySuffix: $suffixArray, insideString: $outsideStr)) {
                        Text("Open statistic")
                    }
                }
                Spacer()
            }
        }
    }
}

