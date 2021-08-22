//
//  LandmarkList.swift
//  fridgeTracker
//
//  Created by Tenzin Mahabir on 2021-08-16.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var editMode = EditMode.inactive
    private static var listCount = 0
    @State private var addingFood = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
    }
    
    private var addButton: some View {
            switch editMode {
            case .inactive:
                return AnyView(
                Button(action: { addingFood.toggle() }) {
                                    Image(systemName: "plus")
                                })
                //add button only for inactive edit mode.
            default:
                return AnyView(EmptyView())
            }
    }
    private func onDelete(offsets: IndexSet) {
        modelData.landmarks.remove(atOffsets: offsets)
        }

    // 3.
    private func onMove(source: IndexSet, destination: Int) {
        modelData.landmarks.move(fromOffsets: source, toOffset: destination)
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }.onDelete(perform: onDelete)
                .onMove(perform: onMove)
                
            }.navigationTitle("Landmarks").navigationBarItems(leading: EditButton(), trailing: addButton)
            // 4.
            .environment(\.editMode, $editMode)
            .sheet(isPresented: $addingFood) {
                FoodInput()
                                
            }
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
