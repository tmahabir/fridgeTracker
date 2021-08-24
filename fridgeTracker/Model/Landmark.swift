//
//  Landmark.swift
//  fridgeTracker
//
//  Created by Tenzin Mahabir on 2021-08-13.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var category: String
    var quantity: Int
    var description: String
    var isFavorite: Bool
    
    public init(id: Int, name: String, park: String, state: String, category: String, quantity: Int, description: String, isFavorite: Bool) {
        self.id = id
        self.name = name
        self.park = park
        self.state = state
        self.category = category
        self.description = description
        self.quantity = quantity
        self.isFavorite = isFavorite
        self.imageName = "Turtle Rock"
        self.coordinates = Coordinates(latitude: 0.0, longitude: 0.0)
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
