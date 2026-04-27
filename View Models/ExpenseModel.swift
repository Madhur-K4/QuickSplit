import Foundation
import Combine

class ExpenseModel: ObservableObject {
    
    @Published var people: [Person] = []
    @Published var expenses: [Expense] = []
    @Published var balances: [String: Double] = [:]
    @Published var settlements: [Transaction] = []
    
    func addPerson(name: String) {
        let person = Person(name: name)
        people.append(person)
    }
    
    func addExpense(title: String, amount: Double, paidBy: Person, splitAmong: [Person]) {
        let expense = Expense(
            title: title,
            amount: amount,
            paidBy: paidBy,
            splitAmong: splitAmong
        )
        
        expenses.append(expense)
        calculateAll()
    }
    
    func calculateAll() {
        balances = SplitCalculator.calculateBalances(expenses: expenses)
        settlements = SplitCalculator.simplifyDebts(balances: balances)
    }

    // ✅ ADD HERE (INSIDE CLASS)
    func originalTransactionCount() -> Int {
        var count = 0
        
        for expense in expenses {
            count += expense.splitAmong.count - 1
        }
        
        return count
    }

    // ✅ ALSO INSIDE CLASS
    func optimizedTransactionCount() -> Int {
        return settlements.count
    }
}
