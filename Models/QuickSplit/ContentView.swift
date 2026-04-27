import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ExpenseModel()
    @State private var name = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Title
            Text("QuickSplit")
                .font(.largeTitle)
            
            // Add Person
            HStack {
                TextField("Enter name", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    if !name.isEmpty {
                        vm.addPerson(name: name)
                        name = ""
                    }
                }
            }
            
            // People Section
            VStack(alignment: .leading) {
                Text("People")
                    .font(.headline)
                
                List(vm.people, id: \.id) { person in
                    Text(person.name)
                }
                .frame(height: 120)
            }
            
            // Add Expense Button
            Button("Add Sample Expense") {
                if vm.people.count >= 2 {
                    vm.addExpense(
                        title: "Dinner",
                        amount: 900,
                        paidBy: vm.people[0],
                        splitAmong: vm.people
                    )
                }
            }
            
            // Settlements Section
            VStack(alignment: .leading) {
                Text("Settlements")
                    .font(.headline)
                
                List(vm.settlements) { t in
                    Text("\(t.from) pays \(t.to): ₹\(String(format: "%.0f", t.amount))")
                }
                .frame(height: 120)
            }
            
            // Optimization Insight (🔥 your differentiator)
            VStack {
                Text("Original Transactions: \(vm.originalTransactionCount())")
                Text("Optimized Transactions: \(vm.optimizedTransactionCount())")
                    .font(.headline)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
