//
//  MultiplicationTable.swift
//  MVVMTable
//
//  Created by MacOsX on 11/17/24.
//

import Foundation


// MultiplicationTable.swift
import Foundation

struct MultiplicationTable {
let number: Int

func generateTable() -> [String] {
var results: [String] = []
for i in 1...10 {
results.append("\(number) x \(i) = \(number * i)")
}
return results
}
}
