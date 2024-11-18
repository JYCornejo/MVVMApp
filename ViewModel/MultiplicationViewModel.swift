//
//  MultiplicationViewModel.swift
//  MVVMTable
//
//  Created by MacOsX on 11/17/24.
//


// MultiplicationViewModel.swift
import Foundation

class MultiplicationViewModel {
private var multiplicationTable: MultiplicationTable?
var tableData: [String] = []

func updateNumber(_ number: Int) {
multiplicationTable = MultiplicationTable(number: number)
tableData = multiplicationTable?.generateTable() ?? []
}
}
