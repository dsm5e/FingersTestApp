//
//  TabBarView.swift
//  FingersTestApp
//
//  Created by dsm 5e on 08.05.2023.
//

import SwiftUI

enum Tabs: Int, CaseIterable {
    case doctor
    case today
    case media
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .doctor:
            DoctorView()
        case .today:
            TodayView(selectedTabCourusel: .constant(.three))
        case .media:
            MediaView()
        }
    }
    
    var title: String {
        switch self {
        case .doctor:
            return "At the doctor"
        case .today:
            return "Today"
        case .media:
            return "Media"
        }
    }
    
    var image: String {
        switch self {
        case .doctor:
            return "stethoscope"
        case .today:
            return "calendar"
        case .media:
            return "tv"
        }
    }
}

struct TabBarView: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(Tabs.allCases, id: \.self) { tabItem in
                Button {
                    selectedTab = tabItem
                } label: {
                    TabBarButton(title: tabItem.title,
                                 image: tabItem.image,
                                 isSelected: selectedTab == tabItem)
                }
            }
        }
        .frame( height: 60)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.today))
    }
}
