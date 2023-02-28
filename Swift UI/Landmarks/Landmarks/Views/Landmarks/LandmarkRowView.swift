//
//  LandmarkRowView.swift
//  Landmarks
//
//  Created by alumno on 25/01/23.
//

import SwiftUI

struct LandmarkRowView: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    static var landMarks = ModelData().landMarks
    static var previews: some View {
        
        VStack{
            LandmarkRowView(landmark: landMarks[0])
            
            LandmarkRowView(landmark: landMarks[1])
            
            LandmarkRowView(landmark: landMarks[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
