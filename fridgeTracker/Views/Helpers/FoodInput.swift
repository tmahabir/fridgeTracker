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
    @State private var quantity: Int = 0
    @State private var category: String = ""
    @State private var isFavorite = false
    @State private var notes: String = ""
    @State private var isEditing = false
    @State private var hasBeenAdded = false
    let foodGroups = ["Fruits", "Vegetables", "Meats", "Grains", "Dairy", "Junk Food", "Other"]

    private var possibleAdd: some View {
        if ( !hasBeenAdded && (foodName != "") && (expiryDate != "") && (storage != "")) {
            
            return AnyView(Button(action: { onAdd() }) {
                Image(systemName: "plus")
                })
        }
        
        return AnyView(EmptyView())
    }
    
    private func onAdd() {
        modelData.landmarks.append(Landmark(id: modelData.landmarks.count, name: foodName, park: expiryDate, state: storage, category: category, quantity: quantity, description: notes, isFavorite: isFavorite))
        hasBeenAdded = true
    }
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    
                    HStack {
                        TextField(
                                "Food name",
                                 text: $foodName
                            ) { isEditing in
                                self.isEditing = isEditing
                            }
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                        .font(.title)
                        .foregroundColor(.primary)
                            
                            FavoriteButton(isSet: $isFavorite)
                    }
                    
                    Spacer()
                
                    HStack {
                        TextField(
                                "Expiry Date?",
                                 text: $expiryDate
                            ) { isEditing in
                                self.isEditing = isEditing
                            }
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                        TextField(
                                "Storage",
                                 text: $storage
                            ) { isEditing in
                                self.isEditing = isEditing
                            }
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                        
                    }.font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    VStack {
                        Menu {
                            ForEach(foodGroups, id: \.self) { foodGroup in
                                Button {
                                    category = foodGroup.description
                                } label: {
                                    Text("\(foodGroup.description)")
                                    // Image(systemName: "tbd")
                                }
                            }
                        } label: {
                            Text("Category: \(category)")
                            // Image(systemName: "tbd")
                        }
                        
                        
                        Text("Quantity: \(quantity)")
                            Picker("", selection: $quantity) {
                                    ForEach(1...100, id: \.self) {
                                        Text("\($0)")
                                    }.scaledToFit()
                        }
                    }
                    
                    Divider()

                        Text("Notes on \(foodName)")
                                            .font(.title2)
                        TextField(
                            "Notes",
                             text: $notes
                        ) { isEditing in
                            self.isEditing = isEditing
                        }
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .border(Color(UIColor.separator))
                }.padding(.vertical)
                
            }.navigationTitle("Add a Food").navigationBarItems( trailing: possibleAdd)
            
        }
        
    }
}

struct FoodInput_Previews: PreviewProvider {
    static var previews: some View {
        FoodInput()
    }
}
