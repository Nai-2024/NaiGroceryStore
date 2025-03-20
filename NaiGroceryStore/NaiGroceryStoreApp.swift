//
//  NaiGroceryStoreApp.swift
//  NaiGroceryStore
//
//  Created by Din Salehy on 2025-03-19.
//

import SwiftUI

@main
struct NaiGroceryStoreApp: App {
    @StateObject private var groceryStore = GroceryStore() // Shared data for items
    var body: some Scene {
        WindowGroup {
            GroceryStoreView() 
        }
    }
}
