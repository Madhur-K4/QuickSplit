# QuickSplit 💸

QuickSplit is an iOS based expense splitting application that intelligently minimizes the number of transactions required to settle group expenses.

Unlike traditional expense splitters, QuickSplit focuses on **optimization**, reducing unnecessary payments using a greedy algorithm.

---

## 🚀 Features

- 👥 Add multiple participants
- 💰 Record shared expenses
- ⚖️ Automatic balance calculation
- 🔄 Smart settlement using optimized transactions
- 📊 Displays:
  - Original number of transactions
  - Optimized (reduced) transactions

---

## Main Idea

When multiple people share expenses, naive settlement leads to unnecessary transactions.

QuickSplit solves this using a **Greedy Algorithm**:
- Identifies creditors (who should receive money)
- Identifies debtors (who owe money)
- Minimizes transactions by matching highest debtor with highest creditor

👉 Result: Fewer payments, simpler settlements

---

## 📱 Example

**Input:**
- A pays ₹900 for A, B, C

**Normal Settlement:**
- B → A ₹300  
- C → A ₹300  

**Output (Optimized):**
- Same result but generalized for complex cases with **minimum transactions**

---

## 🛠️ Tech Stack

- Language: Swift
- UI Framework: SwiftUI
- Architecture: MVVM (Model-View-ViewModel)
- State Management: Combine (`ObservableObject`, `@Published`)
- IDE: Xcode

---
## Project Structure
- QuickSplit
  - Models
    - Person.swift
    - Expense.swift
    - Transaction.swift
  - ViewModels
    - ExpenseModel.swift
    - ExpenseViewModel.swift
  - Services
    - SplitCalculator.swift
  - Views
    - ContentView.swift
  - Resources
    - Assets.xcassets
  - QuickSplitApp.swift
---

## 🔍 What Makes This Project Unique

- Focus on **algorithmic optimization**, not just UI
- Implements **minimum cash flow problem**
- Demonstrates strong understanding of:
  - Data modeling
  - State management
  - Greedy algorithms

---

## 📌 Future Improvements

- Custom/unequal expense splitting
- Graphical insights (who spends most)
- Persistent storage (CoreData / CloudKit)
- Multi-device sync

---

## 👨‍💻 Developer

Madhur Kalra
