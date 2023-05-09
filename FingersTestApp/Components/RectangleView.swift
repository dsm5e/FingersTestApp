//
//  RectangleView.swift
//  FingersTestApp
//
//  Created by dsm 5e on 09.05.2023.
//

import SwiftUI

struct RectangleView: View {
    
    var backgroundColor: Color
    var title: String
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 341, height: 216)
            .foregroundColor(backgroundColor)
            .overlay {
                VStack(spacing: 15) {
                    Text(title)
                        .font(.largeTitle)
                    Text(text)
                        .font(.subheadline)
                        .padding(.horizontal, 30)
                }
            }
            .foregroundColor(.mainText)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(backgroundColor: Color(uiColor: UIColor(red: 1, green: 0.51, blue: 0.749, alpha: 1)), title: "Fingers", text: "The fingers and toes are becoming properly separated, losing any webbing. The fingers and toes are becoming properly separated, losing any webbing.")
    }
}
