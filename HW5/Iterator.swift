//
//  Iterator.swift
//  HW5
//
//  Created by Данил Менделев on 25.11.2022.
//

import Foundation

struct Suffix: Identifiable {
    let id = UUID()
    let subString: String
    var length: Int { self.subString.count }
}

struct SuffixSequence {
    var array: [Suffix]
    
    mutating func append(_ newElement: Suffix) {
        self.array.append(newElement)
    }
    
    
}


struct SuffixSequenceIterator: IteratorProtocol {
    private var array: [Suffix]
    
    init(_ array: [Suffix]) {
        self.array = array
    }
    
    mutating func next() -> Suffix? {
        defer {
            if !self.array.isEmpty {
                array.removeFirst()
            }
        }
        return self.array.first
    }
}

extension SuffixSequence: Sequence {
    func makeIterator() -> SuffixSequenceIterator {
        return SuffixSequenceIterator(array)
    }
}

