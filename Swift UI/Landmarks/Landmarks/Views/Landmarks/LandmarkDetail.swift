//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by alumno on 26/01/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landMarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView() {
            
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -150)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    
                    FavoriteButton(isSet: $modelData.landMarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    
                    Spacer()
                    
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
                Divider()
                
                Text("About \(landmark.name)")
                Text(landmark.description)
            }
            .padding()
            //Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landMarks[0])
            .environmentObject(modelData)
    }
}
