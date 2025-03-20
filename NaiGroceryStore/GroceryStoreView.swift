//
//  GroceryStoreView.swift
//  NaiGroceryStore
//
//  Created by Din Salehy on 2025-03-20.
//

import SwiftUI

struct GroceryStoreView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image with opacity
                Image("grocerystore")
                    .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .scaleEffect(x: 0.6, y: 1.0) // Stretch vertically (increase the `y` value more if needed)
                        .ignoresSafeArea()
                
                
                // Overlay content with text and button
                VStack {
                    Spacer()
                    
                    // Button to navigate to GroceryListView
                    NavigationLink(destination: GroceryListView()) {
                        Text("Start Shopping")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250, height: 60)
                            .background(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            .padding(.top, 20)
                    }
                    .padding(.bottom, 60)
                }
                .padding(.horizontal, 20)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GroceryStoreView()
}
