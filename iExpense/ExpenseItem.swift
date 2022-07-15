//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Дима РМФ on 03.04.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
