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
    
    @State private var selection: Tab = .featured
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        /*NavigationView {
            List(foods) {
                Text($0.name)
            }.navigationBarTitle(Text("Food")).navigationBarItems(
                trailing: Button(action: addFood, label: { Text("Add") }))
        }*/
        TabView(selection: $selection) {
                    LandmarkList()
                        .tabItem {
                            Label("Featured", systemImage: "star")
                        }
                        .tag(Tab.featured)

            LandmarkRow(landmark: ModelData().landmarks[0])
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                        .tag(Tab.list)
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
        ContentView().environmentObject(ModelData())
    }
}
