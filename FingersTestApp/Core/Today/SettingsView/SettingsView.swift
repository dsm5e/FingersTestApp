//
//  SettingsView.swift
//  FingersTestApp
//
//  Created by dsm 5e on 08.05.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSettings: Bool
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(red: 0.902, green: 0.71, blue: 0.647, alpha: 1)).ignoresSafeArea()
            VStack {
                HStack {
                    Text("Settings")
                        .foregroundColor(.mainText)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Circle()
                        .foregroundColor(.gray.opacity(0.5))
                        .overlay {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFill()
                                .scaleEffect(0.5)
                                .foregroundColor(.mainText)
                                .rotationEffect(showSettings ? Angle(degrees: 0) : Angle(degrees: 180))
                                .onTapGesture {
                                    showSettings.toggle()
                                }
                        }
                        .onTapGesture {
                            withAnimation {
                                showSettings.toggle()
                            }
                        }
                        .frame(width: 30, height: 30)
                }
                .padding()
                ZStack() {
                    Rectangle()
                        .foregroundColor(.background).opacity(0.5)
                        .cornerRadius(30)
                        .padding()
                        .frame(height: 235)
                    VStack() {
                        HStack {
                            Text("General")
                                .font(.title)
                                .bold()
                            Spacer()

                        }
                        .padding(.horizontal, 30)
                    }
                }
                Spacer()
            }
            .foregroundColor(.mainText)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSettings: .constant(true))
    }
}

