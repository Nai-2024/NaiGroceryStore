//
//  PaymentView.swift
//  NaiGroceryStore
//
//  Created by Din Salehy on 2025-03-20.
//


import SwiftUI

struct PaymentView: View {
    @State private var cardNumber = ""
    @State private var selectedCardType = "Visa"
    @State private var expiryDate = ""
    @State private var securityCode = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    let cardTypes = ["Visa", "MasterCard", "American Express", "Discover"]

    var body: some View {
        NavigationStack {
            VStack {
                Text("Payment Details")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                Form {
                    Section(header: Text("Card Information")) {
                        TextField("Card Number", text: $cardNumber)
                            .keyboardType(.numberPad)

                        Picker("Card Type", selection: $selectedCardType) {
                            ForEach(cardTypes, id: \.self) { type in
                                Text(type)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        TextField("Expiry Date (MM/YY)", text: $expiryDate)
                            .keyboardType(.numbersAndPunctuation)

                        TextField("Security Code", text: $securityCode)
                            .keyboardType(.numberPad)
                    }

                    Section {
                        Button(action: handlePayment) {
                            Text("Pay Now")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .bold()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(false) // Ensures back button to CheckoutView
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"), action: {
                        if alertTitle == "Payment Successful" {
                            resetForm()
                        }
                    })
                )
            }
        }
    }
     
    // Handles Payment Validation
    func handlePayment() {
        // Validate expiry date format first
        if !isValidExpiryDate(expiryDate) {
            alertTitle = "Invalid Expiry Date"
            alertMessage = "Please enter a valid expiry date in MM/YY format."
        }
        // Validate numeric inputs
        else if isNumeric(cardNumber) && isNumeric(securityCode) {
            alertTitle = "Payment Successful"
            alertMessage = "Your payment with \(selectedCardType) has been processed!"
        } else {
            alertTitle = "Invalid Input"
            alertMessage = "Please enter valid input for Card Number and Security Code."
        }
        showAlert = true
    }

    // Function to Check If Input is Numeric
    func isNumeric(_ text: String) -> Bool {
        return !text.isEmpty && text.allSatisfy { $0.isNumber }
    }

    // Function to Validate Expiry Date Format (MM/YY)
    func isValidExpiryDate(_ text: String) -> Bool {
        let pattern = #"^(0[1-9]|1[0-2])\/\d{2}$"#
        return text.range(of: pattern, options: .regularExpression) != nil
    }

    // Function to Reset the Form After Successful Payment
    func resetForm() {
        cardNumber = ""
        expiryDate = ""
        securityCode = ""
    }
}

#Preview {
    PaymentView()
}
