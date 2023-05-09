//
//  TodayView.swift
//  FingersTestApp
//
//  Created by dsm 5e on 08.05.2023.
//

import SwiftUI

let textDescription = "The fingers and toes are becoming properly separated, losing any webbing. The fingers and toes are becoming properly separated, losing any webbing."

enum TabsCourusel: Int, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    
    var backgroundColor: Color {
        switch self {
        case .one:
            return Color(uiColor: UIColor(red: 1, green: 0.51, blue: 0.749, alpha: 1))
        case .two:
            return Color(uiColor: UIColor(red: 0.858, green: 0.589, blue: 0.497, alpha: 1))
        case .three:
            return Color(uiColor: UIColor(red: 0.858, green: 0.589, blue: 0.497, alpha: 1))
        case .four:
            return Color(uiColor: UIColor(red: 1, green: 0.51, blue: 0.749, alpha: 1))
            
        case .five:
            return Color(uiColor: UIColor(red: 1, green: 0.51, blue: 0.749, alpha: 1))
        case .six:
            return Color(uiColor: UIColor(red: 0.858, green: 0.589, blue: 0.497, alpha: 1))
        }
    }
    
    var title: String {
        switch self {
        case .one:
            return "Fingers"
        case .two:
            return "Fingers"
        case .three:
            return "Fingers"
        case .four:
            return "Fingers"
        case .five:
            return "Fingers"
        case .six:
            return "Fingers"
        }
    }
    
    var text: String {
        switch self {
        case .one:
            return textDescription
        case .two:
            return textDescription
        case .three:
            return textDescription
        case .four:
            return textDescription
        case .five:
            return textDescription
        case .six:
            return textDescription
        }
    }
}

struct TodayView: View {
    
    @Binding var selectedTabCourusel: TabsCourusel
    @State private var showTabCouruselOne = true
    @State private var showTabCouruselTwo = true
    
    
    var body: some View {
        ScrollView {
            VStack {
                CouruselView(showTabCourusel: $showTabCouruselOne)
                
                MoodBreakdownView()
                
                CouruselView(showTabCourusel: $showTabCouruselTwo)
            }
        }
    }
}


struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView(selectedTabCourusel: .constant(.three))
            .previewLayout(.sizeThatFits)
    }
}

struct CouruselView: View {
    
    @Binding var showTabCourusel: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                    .foregroundColor(.mainText)
                    .font(.title)
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
                            .rotationEffect(showTabCourusel ? Angle(degrees: 0) : Angle(degrees: 180))
                    }
                    .onTapGesture {
                        withAnimation {
                            showTabCourusel.toggle()
                        }
                    }
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal)
            if showTabCourusel {
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        HStack {
                            ForEach(TabsCourusel.allCases, id: \.self) { tab in
                                RectangleView(backgroundColor: tab.backgroundColor, title: tab.title, text: tab.text)
                            }
                            .onAppear {
                                proxy.scrollTo(TabsCourusel.three, anchor: .center)
                            }
                        }
                        .padding()
                    }
                }
                HStack(spacing: 10) {
                    ForEach(TabsCourusel.allCases, id: \.self ) { tab in
                        Circle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 10, height: 10)
                    }
                }
            }
        }
    }
}

struct MoodBreakdownView: View {
    
    @State var pickerSelection = 0
    @State var barValues : [[CGFloat]] =
    [
        [23,55,80,20,85,100]
    ]
    @State var mood: [String] = [
        "😩", "😢", "😟", "😐", "😀", "😎"
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(uiColor: UIColor(red: 0.096, green: 0.091, blue: 0.089, alpha: 1)))
                .frame(width: 350, height: 205)
                .cornerRadius(30)
                .overlay(alignment: .topLeading) {
                    Text("Mood Breakdown")
                        .foregroundColor(.white)
                        .font(.headline)
                        .offset(x: 20, y: 20)
                }
            
            HStack(alignment: .center, spacing: 30) {
                ForEach(0..<barValues[pickerSelection].count, id: \.self) { index in
                    
                    VStack {
                        BarView(value: barValues[pickerSelection][index], cornerRadius: 15, mood: mood[index])
                    }
                }
            }.padding(.top, 15).animation(.default)
        }
    }
}

struct BarView: View{
    
    var value: CGFloat
    var cornerRadius: CGFloat
    var mood: String
    
    var body: some View {
        VStack {
            
            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 10, height: 100).foregroundColor(.gray)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 10, height: value).foregroundColor(.red)
                    .shadow(color: .red, radius: 5)
            }
            Text(mood)
        }
        
    }
}

