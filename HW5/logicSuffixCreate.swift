//
//  logicSuffixCreate.swift
//  HW5
//
//  Created by Данил Менделев on 17.11.2022.
//

import Foundation

typealias SubString = (sub: String, p: Int, c: Int)

struct SuffixArray {
    var str: String
    private var k: Double = 1
    //    var count = 0
    private var letStr: Int
    private var arraySuffix = [SubString]()
    var arrayP = [Int]()
    
    init(insideString: String) {
        self.str = insideString
        self.letStr = self.str.count + 1 // add end symbol
        self.addEndSymbol()
        self.getArraySuffix()
    }
    
    private mutating func addEndSymbol() {
        self.str += "$" + self.str
    }
    
    private mutating func kAlgorithm() {
        self.arraySuffix.removeAll()
        
        for count in 0..<self.letStr - 1 {
            let startIndex = self.str.index(self.str.startIndex, offsetBy: 0+count)
            let endIndex = self.str.index(self.str.startIndex, offsetBy: Int(pow(2, self.k)) + count)
            
            self.arraySuffix.append(SubString(
                sub: String(self.str[startIndex..<endIndex]),
                p: count + 1,
                c: 0
            ))
        }
    }
    
    private mutating func sortArraySuffix() {
        self.arraySuffix.sort { $0.sub < $1.sub }
        var c = 0
        for element in 0..<arraySuffix.count {
            if element != 0 {
                if arraySuffix[element].sub == arraySuffix[element - 1].sub {
                    arraySuffix[element].c = c - 1
                } else {
                    arraySuffix[element].c = c
                    c += 1
                }
            } else {
                arraySuffix[element].c = c
                c += 1
            }
        }
    }
    
    private mutating func getArraySuffix() {
        while Int(pow(2, k)) < self.letStr {
            self.kAlgorithm()
            self.sortArraySuffix()
            self.k += 1
            if self.arraySuffix.last!.c == arraySuffix.count - 1 {
                print("break")
                break
            } // if all substring is different
        }
        for element in self.arraySuffix {
            self.arrayP.append(element.p)
        }
    }
    
}



