//
//  TabBarButton.swift
//  FingersTestApp
//
//  Created by dsm 5e on 08.05.2023.
//

import SwiftUI

struct TabBarButton: View {
    
    var title: String
    var image: String
    var isSelected: Bool
    
    var body: some View {
            GeometryReader { geo in
                VStack(spacing: 5) {
                    Rectangle()
                        .frame(width: geo.size.width/1.2, height: 4)
                        .cornerRadius(15)
                        .padding(.leading, geo.size.width/120)
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)

                        Text(title)
                            .font(isSelected ? .subheadline : .subheadline.bold())
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .foregroundColor(!isSelected ? .secondText : .mainText)
            .shadow(color: isSelected ? .white : .black,
                    radius: isSelected ? 5 : 0)
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TabBarButton(title: "At the doctor", image: "stethoscope", isSelected: true)
        }
    }
}
