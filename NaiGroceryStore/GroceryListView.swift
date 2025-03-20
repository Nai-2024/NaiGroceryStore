//
//  GroceryListView.swift
//  NaiGroceryStore
//
//  Created by Din Salehy on 2025-03-19.
//

import SwiftUI

struct GroceryListView: View {
    @StateObject private var groceryStore = GroceryStore() // Store object
    @State private var totalPrice: Double = 0.0 // Track total price
    
    // Function to filter selected items (items with quantity > 0)
    private var selectedItems: [GroceryItem] {
        groceryStore.items.filter { $0.quantity > 0 }
    }
    
    var body: some View {
        NavigationStack { // Wrapping the view in NavigationView
            ZStack {
                Color.black.opacity(0.4).ignoresSafeArea() // Black background with reduced opacity
                
                VStack(spacing: 0) {
                    // Title
                    Text("Select your item")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    // Item list (with click functionality)
                    ScrollView {
                        VStack(spacing: 3) {
                            ForEach(groceryStore.items) { item in
                                HStack {
                                    // Image
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                        .padding(.trailing, 25)
                                    
                                    // Item name and price
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        
                                        Text("$\(item.price, specifier: "%.2f") / lb")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    // Total price for this item
                                    VStack(alignment: .trailing) {
                                        Text("Total") // Move label to the top
                                            .font(.subheadline)
                                            .bold()
                                        Text("$\(item.price * Double(item.quantity), specifier: "%.2f")") // Value below
                                            .foregroundColor(.red.opacity(0.7))
                                            .bold()
                                    }
                                    .frame(width: 100, alignment: .trailing)
                                    .padding(.trailing, 6)
                                    
                                    // Quantity Increase Button
                                    VStack {
                                        Button(action: {
                                            item.quantity += 1
                                            totalPrice += item.price
                                        }) {
                                            Image(systemName: "plus.circle.fill")
                                                .foregroundColor(.green)
                                                .font(.title2)
                                        }
                                        
                                        // Remove Item Button
                                        if item.quantity > 0 { // Only show if quantity is greater than 0
                                            Button(action: {
                                                item.quantity -= 1
                                                totalPrice -= item.price
                                            }) {
                                                Image(systemName: "minus.circle.fill")
                                                    .foregroundColor(.red)
                                                    .font(.title2)
                                            }
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 10)
                    }
                    
                    // Total price at the bottom
                    ZStack {
                        Color.gray.opacity(0.5).ignoresSafeArea()
                        HStack {
                            Text("Total")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                            Spacer()
                            // Display dynamic total price
                            Text("$\(totalPrice, specifier: "%.2f")")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 30)
                    }
                    .frame(height: 50)
                    
                    // Checkout Button below the total price
                    NavigationLink(destination: CheckOutView(selectedItems: selectedItems)) { // Pass selectedItems
                        Text("Checkout")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 320, height: 10, alignment: .center )
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                            .padding(.top, 10)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    GroceryListView()
        .navigationBarTitleDisplayMode(.inline)
}


/*
import SwiftUI

struct GroceryListView: View {
    @StateObject private var groceryStore = GroceryStore() // Store object
    @State private var totalPrice: Double = 0.0 // Track total price
    
    // Function to filter selected items (items with quantity > 0)
    private var selectedItems: [GroceryItem] {
        groceryStore.items.filter { $0.quantity > 0 }
    }
    
    var body: some View {
        NavigationView { // Wrapping the view in NavigationView
            ZStack {
                Color.black.opacity(0.4).ignoresSafeArea() // Black background with reduced opacity
                
                VStack(spacing: 0) {
                    // Title
                    Text("Select your item")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    // Item list (with click functionality)
                    ScrollView {
                        VStack(spacing: 3) {
                            ForEach(groceryStore.items) { item in
                                HStack {
                                    // Image
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                        .padding(.trailing, 25)
                                    
                                    // Item name and price
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        
                                        Text("$\(item.price, specifier: "%.2f") / lb")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    // Total price for this item
                                    VStack(alignment: .trailing) {
                                        Text("Total") // Move label to the top
                                            .font(.subheadline)
                                            .bold()
                                        Text("$\(item.price * Double(item.quantity), specifier: "%.2f")") // Value below
                                            .foregroundColor(.red.opacity(0.7))
                                            .bold()
                                    }
                                    .frame(width: 100, alignment: .trailing)
                                    .padding(.trailing, 6)
                                    
                                    // Quantity Increase Button
                                    Button(action: {
                                        item.quantity += 1
                                        totalPrice += item.price
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.green)
                                            .font(.title2)
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 10)
                    }
                    
                    // Total price at the bottom
                    ZStack {
                        Color.gray.opacity(0.5).ignoresSafeArea()
                        HStack {
                            Text("Total")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                            Spacer()
                            // Display dynamic total price
                            Text("$\(totalPrice, specifier: "%.2f")")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 30)
                    }
                    .frame(height: 50)
                    
                    // Checkout Button below the total price
                    NavigationLink(destination: CheckOutView(selectedItems: selectedItems)) { // Pass selectedItems
                        Text("Checkout")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 320, height: 10, alignment: .center )
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                            .padding(.top, 10)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    GroceryListView()
        .navigationBarTitleDisplayMode(.inline)
}

*/
