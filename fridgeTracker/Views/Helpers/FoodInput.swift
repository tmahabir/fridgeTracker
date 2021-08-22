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
    @State private var isFavorite = false
    @State private var notes: String = ""
    @State private var isEditing = false
    @State private var hasBeenAdded = false
    
    private var possibleAdd: some View {
        if ( !hasBeenAdded && (foodName != "") && (expiryDate != "") && (storage != "")) {
            
            return AnyView(Button(action: { onAdd() }) {
                Image(systemName: "plus")
                })
        }
        
        return AnyView(EmptyView())
    }
    
    private func onAdd() {
        modelData.landmarks.append(Landmark(id:12, name: foodName, park: expiryDate, state: storage, description: notes, isFavorite: isFavorite))
        hasBeenAdded = true
    }
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    
                    HStack {
                        TextField(
                                "Food name?",
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
                        
                    }.font(.subheadline)
                    .foregroundColor(.secondary)
                    
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
