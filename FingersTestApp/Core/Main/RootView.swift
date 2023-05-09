//
//  RootView.swift
//  FingersTestApp
//
//  Created by dsm 5e on 08.05.2023.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .today
    @State var showSettings = false
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                HeaderView(showSettings: $showSettings)
                selectedTab.view
                    .transition(.opacity.animation(.easeInOut))
                Spacer()
                TabBarView(selectedTab: $selectedTab)
            }
            
            SettingsView(showSettings: $showSettings)
                .cornerRadius(30)
                .padding(.top, 30)
                .offset(y: showSettings ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RootView()
        }
    }
}
