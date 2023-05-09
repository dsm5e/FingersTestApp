//
//  HeaderView.swift
//  FingersTestApp
//
//  Created by dsm 5e on 08.05.2023.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showSettings: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center){
                Button {
                    
                } label: {
                    Text("Today,  Thu 9 Feb")
                        .frame(width: 80)
                }
                Spacer()
                Image("LogoImage")
                    .offset(x: -10)
                Spacer()
                Button {
                    showSettings.toggle()
                    print(showSettings)
                } label: {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 30)
                        .offset(x: 30)
                }
            }
            .foregroundColor(.secondText)
            .padding(.horizontal)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondText)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showSettings: .constant(true))
    }
}
