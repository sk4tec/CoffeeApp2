//
//  CoffeeCellView.swift
//  CoffeeApp2
//
//  Created by Sunjay Kalsi on 24/06/2024.
//

import SwiftUI

struct CoffeeCellView: View {
    let title: String
    let description: String
    let image: String

    var body: some View {
        VStack(alignment: .leading){
            HStack (alignment: .top) {
                if let imageUrl = URL(string: image) {
                    AsyncImage(url: imageUrl) { asyncImage in
                        asyncImage
                            .image?.resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(8.0)
                    }
                }
                HStack(alignment: .top) {
                    VStack (alignment: .leading) {
                        Text(title)
                            .font(.title)
                        Text(description)
                            .lineLimit(3)
                            .font(.body)
                    }
                }
            }
        }
    }
}

#Preview {
    CoffeeCellView(title: "Black Coffee", description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir", image:  "https://images.unsplash.com/photo-1494314671902-399b18174975")
        .background(Color.red)
}
