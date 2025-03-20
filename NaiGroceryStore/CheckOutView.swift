//
//  ContentView.swift
//  NaiGroceryStore
//
//  Created by Din Salehy on 2025-03-19.
//

import SwiftUI

struct CheckOutView: View {
    var selectedItems: [GroceryItem] // Selected items

    var totalPrice: Double {
        selectedItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.7)
                    .ignoresSafeArea()

                VStack {
                    Text("Checkout Details")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding()

                    Divider()
                        .background(Color.black)
                        .padding(.top, -15)

                    ScrollView {
                        VStack(spacing: 3) {
                            ForEach(selectedItems) { item in
                                HStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .padding(.trailing, 10)

                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                            .foregroundColor(.black)

                                        Text("$\(item.price, specifier: "%.2f") / lb")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }

                                    Spacer()

                                    VStack(alignment: .trailing) {
                                        Text("Total")
                                            .foregroundColor(.black)
                                            .bold()

                                        let itemTotal = item.price * Double(item.quantity)
                                        Text("$\(itemTotal, specifier: "%.2f")")
                                            .foregroundColor(.red.opacity(0.7))
                                            .bold()
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, -15)

                    // Total price section
                    HStack {
                        Text("Total:")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()

                        Spacer()

                        Text("$\(totalPrice, specifier: "%.2f")")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                    // Navigation to PaymentView
                    NavigationLink(destination: PaymentView()) {
                        Text("Proceed to Checkout")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                    .padding(.horizontal)
                }
                .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    let store = GroceryStore()
    return CheckOutView(selectedItems: store.items.filter { $0.quantity > 0 })
}
