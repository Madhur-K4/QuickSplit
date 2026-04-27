import Foundation
import Combine

class ExpenseViewModel: ObservableObject {
    
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
}
