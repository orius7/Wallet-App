//by aidan - 2/14/25

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var bank: String = ""
    @State private var cardType: CardType = .visa
    @State private var cardNumber: String = ""
    @State private var secureCode: String = ""
    @State private var validThrough = Date()
    @State private var selectedColor: Color = Colors.blue
    @State private var showPreview = false
    
    var body: some View {
        Form {
            Section("Signature") {
                TextField("Card Holder Name", text: $name)
                TextField("Bank", text: $bank)
                
                Picker("Card Type", selection: $cardType) {
                    ForEach(CardType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.automatic)
            }
            
            Section("Details") {
                TextField("Card Number", text: $cardNumber)
                TextField("Secure Code", text: $secureCode)
                DatePicker("Valid Through", selection: $validThrough, displayedComponents: [.date])
            }
            
            Section("Card Color") {
                HStack(spacing: 30) {
                    ForEach(Colors.all, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: selectedColor == color ? 4 : 0)
                            )
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            }
            
            Button("Add Card to Wallet") {
                showPreview = true
            }
        }
        .sheet(isPresented: $showPreview) {
            CardPreviewView(
                name: name,
                bank: bank,
                cardType: cardType,
                cardNumber: cardNumber,
                secureCode: secureCode,
                validThrough: validThrough,
                cardColor: selectedColor
            )
            .presentationDetents([.fraction(0.3)])
        }
    }
}

struct CardPreviewView: View {
    let name: String
    let bank: String
    let cardType: CardType
    let cardNumber: String
    let secureCode: String
    let validThrough: Date
    let cardColor: Color
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cardColor)
                .frame(width: 350, height: 200)
                .overlay(
                    VStack(alignment: .leading, spacing: 10) {
                        Text(bank)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack {
                            Text(cardType.rawValue)
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Spacer()
                            Text(cardNumber)
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Valid Through")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                Text(validThroughFormatted())
                                    .font(.body)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("CVV")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                Text(secureCode)
                                    .font(.body)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Text(name.uppercased())
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                )
            
            Spacer()
        }
        .padding()
    }
    
    private func validThroughFormatted() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yy"
        return formatter.string(from: validThrough)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
