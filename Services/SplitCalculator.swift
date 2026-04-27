import Foundation

class SplitCalculator {
    
    // FIRST FUNCTION
    static func calculateBalances(expenses: [Expense]) -> [String: Double] {
        var balances: [String: Double] = [:]

        for expense in expenses {
            let splitAmount = expense.amount / Double(expense.splitAmong.count)
            
            for person in expense.splitAmong {
                balances[person.name, default: 0] -= splitAmount
            }
            
            balances[expense.paidBy.name, default: 0] += expense.amount
        }

        return balances
    }
    
    // SECOND FUNCTION (SEPARATE, NOT INSIDE ABOVE)
    static func simplifyDebts(balances: [String: Double]) -> [Transaction] {
        
        var creditors = balances.filter { $0.value > 0 }
        var debtors = balances.filter { $0.value < 0 }
        
        var transactions: [Transaction] = []
        
        while !creditors.isEmpty && !debtors.isEmpty {
            
            let creditor = creditors.max { $0.value < $1.value }!
            let debtor = debtors.min { $0.value < $1.value }!
            
            let amount = min(creditor.value, -debtor.value)
            
            transactions.append(Transaction(
                from: debtor.key,
                to: creditor.key,
                amount: amount
            ))
            
            creditors[creditor.key]! -= amount
            debtors[debtor.key]! += amount
            
            if creditors[creditor.key]! == 0 {
                creditors.removeValue(forKey: creditor.key)
            }
            
            if debtors[debtor.key]! == 0 {
                debtors.removeValue(forKey: debtor.key)
            }
        }
        
        return transactions
    }
}
