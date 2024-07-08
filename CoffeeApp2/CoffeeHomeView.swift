//
//  ContentView.swift
//  CoffeeApp2
//
//  Created by Sunjay Kalsi on 23/06/2024.
//

import SwiftUI

struct CoffeeHomeView: View {
    @StateObject var viewModel = CoffeeHomeViewViewModel()
    @State var firstLoad = true

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.coffeeList) { item in
                    Text(item.description)
                }
            }
            .padding()
            .task {
                if firstLoad {
                    await viewModel.loadData()
                    firstLoad = false
                }
            }
        }
    }
}

#Preview {
    CoffeeHomeView()
}
