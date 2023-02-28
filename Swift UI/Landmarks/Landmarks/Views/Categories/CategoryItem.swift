//
//  CategoryItem.swift
//  Landmarks
//
//  Created by alumno on 26/01/23.
//

import SwiftUI

struct CategoryItem: View {
    var landMark: Landmark
    
    var body: some View {
        VStack(alignment: .leading){
            landMark.image
                .resizable()
                .frame(width: 155,height: 155)
                .cornerRadius(10)
            Text(landMark.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landMark: ModelData().landMarks[0])
            
    }
}
