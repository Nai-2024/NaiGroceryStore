//
//  GroceryItem.swift
//  NaiGroceryStore
//
//  Created by Din Salehy on 2025-03-19.
//

import SwiftUI

// Make GroceryItem a class for mutability in SwiftUI
class GroceryItem: Identifiable, ObservableObject {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    @Published var quantity: Int // Observable property

    init(name: String, price: Double, imageName: String, quantity: Int = 0) {
        self.name = name
        self.price = price
        self.imageName = imageName
        self.quantity = quantity
    }
}

// Grocery Data Model
class GroceryStore: ObservableObject {
    @Published var items: [GroceryItem] = [
        GroceryItem(name: "Apple", price: 1.50, imageName: "apple"),
        GroceryItem(name: "Banana", price: 0.75, imageName: "banana"),
        GroceryItem(name: "Cherry", price: 2.50, imageName: "cherry"),
        GroceryItem(name: "Melon", price: 2.50, imageName: "melon"),
        GroceryItem(name: "Watermelon", price: 2.50, imageName: "watermelon"),
        GroceryItem(name: "Mango", price: 2.50, imageName: "mango"),
        GroceryItem(name: "Orange", price: 2.50, imageName: "orange"),
        GroceryItem(name: "Kiwi", price: 2.50, imageName: "kiwi"),
        GroceryItem(name: "Peach", price: 2.50, imageName: "peach"),
        GroceryItem(name: "Onion", price: 2.50, imageName: "onion"),
        GroceryItem(name: "Carrot", price: 2.50, imageName: "carrot"),
        GroceryItem(name: "Broccoli", price: 2.50, imageName: "broccoli"),
        GroceryItem(name: "Cauliflower", price: 3.20, imageName: "cauliflower"),
        GroceryItem(name: "Lettuce", price: 2.50, imageName: "lettuce"),
        GroceryItem(name: "Tomato", price: 2.50, imageName: "tomato")
    ]
}


