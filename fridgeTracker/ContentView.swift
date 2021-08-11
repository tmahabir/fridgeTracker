//
//  ContentView.swift
//  fridgeTracker
//
//  Created by Tenzin Mahabir on 2021-08-04.
//

import SwiftUI

struct Food: Identifiable {
    let name: String
    let id = UUID()
}

struct ContentView: View {
    @State private var foods = [
        Food(name: "Bananas"),
        Food(name: "Chicken"),
        Food(name: "Cereal"),
        Food(name: "Ice Cream"),
        Food(name: "Bread")
    ]
    
    var body: some View {
        NavigationView {
            List(foods) {
                Text($0.name)
            }.navigationBarTitle(Text("Food")).navigationBarItems(
                trailing: Button(action: addFood, label: { Text("Add") }))
        }
    }
    
    func addFood() {
        if let randomFood = foods.randomElement() {
          foods.append(randomFood)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
