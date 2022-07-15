//
//  ContentView.swift
//  iExpense
//
//  Created by Дима РМФ on 02.04.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpensed = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpensed = true
                } label: {
                    Image(systemName: "plus")
                    }
                }
            .sheet(isPresented: $showingAddExpensed) {
                AddView(expenses: expenses)
            }
            }
        }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
        }
    }
        
        



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
