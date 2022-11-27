//import Foundation

//typealias Suffix = (sub: String, p: Int, c: Int)
//
//struct SuffixArray {
//    var str: String
//    var k: Double = 1
////    var count = 0
//    var letStr: Int
//    var arraySuffix = [Suffix]()
//    var arrayP = [Int]()
//
//    init(insideString: String) {
//        self.str = insideString
//        self.letStr = self.str.count + 1 // add end symbol
//        addEndSymbol()
//    }
//
//    private mutating func addEndSymbol() {
//        self.str += "$" + self.str
//    }
//
//    private mutating func kAlgorithm() {
//        self.arraySuffix.removeAll()
//
//        for count in 0..<self.letStr - 1 {
//            let startIndex = self.str.index(self.str.startIndex, offsetBy: 0+count)
//            let endIndex = self.str.index(self.str.startIndex, offsetBy: Int(pow(2, self.k)) + count)
//
//            self.arraySuffix.append(Suffix(
//                sub: String(self.str[startIndex..<endIndex]),
//                p: count + 1,
//                c: 0
//            ))
//        }
//    }
//
//    private mutating func sortArraySuffix() {
//        self.arraySuffix.sort { $0.sub < $1.sub }
//        var c = 0
//        for element in 0..<arraySuffix.count {
//            if element != 0 {
//                if arraySuffix[element].sub == arraySuffix[element - 1].sub {
//                    arraySuffix[element].c = c - 1
//                } else {
//                    arraySuffix[element].c = c
//                    c += 1
//                }
//            } else {
//                arraySuffix[element].c = c
//                c += 1
//            }
//        }
//    }
//
//    mutating func printArrayP() {
//        for element in self.arraySuffix {
//            self.arrayP.append(element.p)
//        }
//        print(self.arrayP)
//    }
//
//}

