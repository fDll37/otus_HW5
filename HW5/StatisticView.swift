//
//  StatisticView.swift
//  HW5
//
//  Created by Данил Менделев on 25.11.2022.
//

import SwiftUI

struct StatisticView: View {
    @Binding var arraySuffix: [Int]
    @Binding var insideString: String
    @State private var arraySub = SuffixSequence(array: [])
    var body: some View {
      
        List {
            ForEach(arraySub.array) {sub in
                Text("sub = \(sub.subString)")
            }
        }
        .onAppear {
            arraySub = createSubStringArray(array: arraySuffix, originString: insideString)
//            arraySub.array.sort {$0.length > $1.length}
            
        }
    }
    
    func createSubStringArray(array: [Int], originString: String) -> SuffixSequence {
        var arraySub = SuffixSequence(array: [])
        for i in array {
            let startIndex = originString.index(originString.startIndex, offsetBy: i-1)
            let endIndex = originString.endIndex
            arraySub.append(Suffix(subString: String(originString[startIndex..<endIndex])))
        }
        return arraySub
    }
}

