**💳 SwiftUI Wallet App**

A simple digital wallet interface built with SwiftUI that allows users to enter payment card information, customize the card’s appearance, and preview the card in real time.

This project focuses on modern SwiftUI development patterns, clean UI design, and state-driven user interaction.

**📱 Features**

* Add cardholder and bank information

* Select card type (Visa, etc.)

Enter card details (number, CVV, expiration date)

Choose a custom card color

Live card preview displayed in a modal sheet

Clean, responsive SwiftUI layout using Form and Section

**🛠️ Technologies Used**

Swift

SwiftUI

@State for reactive UI updates

Form, Picker, DatePicker

Modal presentation with .sheet

Custom UI components and styling

**📸 Preview**

When a user taps “Add Card to Wallet”, a preview of the card is displayed showing:

Bank name

Card type

Card number

Expiration date

CVV

Cardholder name

Selected card color

**🚀 Getting Started**
Prerequisites

macOS

Xcode 15+ (recommended)

iOS 17+ Simulator or device

Installation

Clone the repository:

git clone https://github.com/orius7/Potluck-main.git


Open the project in Xcode:

open WalletApp.xcodeproj


Build and run the project using an iOS Simulator or device.

📂 Project Structure
├── ContentView.swift        # Main form and input handling
├── CardPreviewView.swift   # Card preview UI
├── CardType.swift          # Enum for card types
├── Colors.swift            # Predefined card colors

**🧠 What I Learned**

Managing UI state with @State

Structuring SwiftUI views for reusability

Building interactive forms

Presenting modal views with custom detents

Formatting dates for display

Creating clean, user-friendly interfaces

**🔮 Future Improvements**

Input validation and formatting (card number, CVV)

Masking sensitive card information

Persisting cards using local storage

Support for multiple saved cards

Animations and transitions

**👤 Author**

Aidan Lei and Aryan Khana
Built on 2/14/25
