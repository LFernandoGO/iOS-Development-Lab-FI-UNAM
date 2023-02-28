//
//  LandmarkList.swift
//  Landmarks
//
//  Created by alumno on 26/01/23.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark]{
        modelData.landMarks.filter { landmark in
            (landmark.isFavorite || !showFavoritesOnly)
        }
    }
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(modelData)
    }
}
