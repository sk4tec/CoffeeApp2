//
//  ContentView.swift
//  CoffeeApp2
//
//  Created by Sunjay Kalsi on 23/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State var coffeeList: [CoffeeData] = [CoffeeData]()

    var body: some View {
        VStack {
            List {
                ForEach(coffeeList) { item in
                    CoffeeCellView(title: item.title, description: item.description, image: item.image)
                }
            }
       }
        .padding()
        .task {
            do {
                coffeeList = try await NetworkApi.getCoffee()
            } catch {
                print("error \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
