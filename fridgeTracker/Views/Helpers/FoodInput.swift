//
//  FoodInput.swift
//  fridgeTracker
//
//  Created by Tenzin Mahabir on 2021-08-20.
//

import SwiftUI

struct FoodInput: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var foodName: String = ""
    @State private var expiryDate: String = ""
    @State private var storage: String = ""
    @State private var isEditing = false
    
    private func onAdd() {
        modelData.landmarks.append(modelData.landmarks[0])
        modelData.landmarks.append(Landmark(id:12, name: foodName, park: expiryDate, state: storage, description: "words", isFavorite: true))
    }
    
    var body: some View {
        NavigationView {
            List {
            TextField(
                    "Food name?",
                     text: $foodName
                ) { isEditing in
                    self.isEditing = isEditing
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            TextField(
                    "When does it expire?",
                     text: $expiryDate
                ) { isEditing in
                    self.isEditing = isEditing
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            TextField(
                    "Where are you storing it?",
                     text: $storage
                ) { isEditing in
                    self.isEditing = isEditing
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            }.navigationTitle("Add a Food").navigationBarItems( trailing: Button(action: { onAdd() }) {
                Image(systemName: "plus")
                })
        }
    }
}

struct FoodInput_Previews: PreviewProvider {
    static var previews: some View {
        FoodInput()
    }
}
