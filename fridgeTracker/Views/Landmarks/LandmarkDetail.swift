//
//  LandmarkDetail.swift
//  fridgeTracker
//
//  Created by Tenzin Mahabir on 2021-08-16.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    
    var body: some View {
        ScrollView {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)

                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)

                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                            .foregroundColor(.primary)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }

                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                            
                        }.font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Category: \(landmark.category)")
                        Spacer()
                        Text("Amount: \(landmark.quantity)")
                        }.font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    
                    Divider()

                        Text("About \(landmark.name)")
                                            .font(.title2)
                        Text(landmark.description)
                    
                }
                .padding()
                
        }.navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0]).environmentObject(ModelData())
    }
}
