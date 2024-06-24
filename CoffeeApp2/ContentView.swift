//
//  ContentView.swift
//  CoffeeApp2
//
//  Created by Sunjay Kalsi on 23/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State var coffeeList: [CoffeeModel] = [CoffeeModel]()
    @State var firstLoad = true

    var body: some View {
        NavigationView {
            List {
                ForEach($coffeeList) { $item in
                    NavigationLink(destination: {
                        CoffeeDetailView(
                            title: item.title,
                            description: item.description,
                            image: item.image,
                            ingredients: item.ingredients,
                            like: $item.like
                        )
                    },
                    label: {
                        CoffeeCellView(title: item.title, description: item.description, image: item.image, like: item.like)
                    })
                }
            }
            .padding()
            .task {
                if firstLoad {
                    do {
                        coffeeList = try await NetworkApi.getCoffee()
                        firstLoad = false
                    } catch {
                        print("error \(error)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
