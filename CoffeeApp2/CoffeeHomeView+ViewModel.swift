//
//  CoffeeHomeView+ViewModel.swift
//  CoffeeApp2
//
//  Created by Sunjay Kalsi on 25/06/2024.
//

import Foundation
import Combine

class CoffeeHomeViewViewModel: ObservableObject {
    @Published var coffeeList: [CoffeeModel] = []

    @MainActor
    func loadData() async {
        do {
            self.coffeeList = try await NetworkApi.getCoffee()
        } catch {
            print("onAppear \(error)")
        }
    }
}
