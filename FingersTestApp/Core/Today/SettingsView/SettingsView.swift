//
//  SettingsView.swift
//  FingersTestApp
//
//  Created by dsm 5e on 08.05.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSettings: Bool
    @State var notificationToggle: Bool = false
    @State var calendarToggle: Bool = false
    @State var fetusToggle: Bool = false
    @State var toDoToggle: Bool = false
    @State var weightToggle: Bool = false
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(red: 0.902, green: 0.71, blue: 0.647, alpha: 1)).ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Settings")
                        .foregroundColor(.mainText)
                        .font(.title)
                        .bold()
                    Spacer()
                    Circle()
                        .foregroundColor(.white.opacity(0.5))
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
                .padding(.top, 20)
                .padding(.horizontal)
                
                VStack(spacing: 15) {
                    GeneralView(notificationToggle: $notificationToggle)
                    AccountView()
                    TodayBlocksView(calendarToggle: $calendarToggle, fetusToggle: $fetusToggle, toDoToggle: $toDoToggle, weightToggle: $weightToggle)
                    
                }
                .padding(.top, 20)
                .padding(.horizontal)
                
                Rectangle()
                    .frame(width: 140, height: 5)
                    .cornerRadius(10)
                    .padding(.top, 15)
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


struct GeneralView: View {
    
    @Binding var notificationToggle: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("General")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding(.top, 5)
            .padding(.bottom, 5)
            
            VStack {
                HStack {
                    Text("Subscription")
                        .font(.subheadline)
                    Spacer()
                    Text("Active until 20 March 2024")
                        .font(.subheadline)
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
            }
            
            VStack {
                HStack {
                    Toggle("Notification", isOn: $notificationToggle)
                        .font(.subheadline)
                        .toggleStyle(SwitchToggleStyle(tint: Color(uiColor: UIColor(red: 0.32, green: 0, blue: 1, alpha: 1))))
                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
            }
            
            VStack {
                HStack {
                    Text("Rate App")
                        .font(.subheadline)
                    Spacer()
                    NavigationLink {
                        RootView()
                    } label: {
                        Image(systemName: "arrow.right")
                            .padding(.trailing, 15)
                    }
                    
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
            }
            VStack {
                HStack {
                    Text("Contact support")
                        .font(.subheadline)
                    Spacer()
                    NavigationLink {
                        RootView()
                    } label: {
                        Image(systemName: "arrow.right")
                            .padding(.trailing, 15)
                    }
                    
                }
                .padding(.bottom, 10)
            }
            
            
        }
        .padding()
        .background(Color.black.opacity(0.5))
        .cornerRadius(30)
    }
}


struct AccountView: View {
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("LogOut")
                        .font(.subheadline)
                    Spacer()
                    NavigationLink {
                        RootView()
                    } label: {
                        Image(systemName: "arrow.right")
                            .padding(.trailing, 15)
                    }
                    
                }
                .padding(.top, 10)
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
            }
            VStack {
                HStack {
                    Text("Delete Account")
                        .font(.subheadline)
                    Spacer()
                    NavigationLink {
                        RootView()
                    } label: {
                        Image(systemName: "arrow.right")
                            .padding(.trailing, 15)
                    }
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 1)
                }
            }
            VStack {
                HStack {
                    Text("Download personal data")
                        .font(.subheadline)
                    Spacer()
                    NavigationLink {
                        RootView()
                    } label: {
                        Image(systemName: "arrow.right")
                            .padding(.trailing, 15)
                    }
                    
                }
                .padding(.bottom, 5)
            }
            
            
        }
        .padding()
        .background(Color.black.opacity(0.5))
        .cornerRadius(30)
    }
}

struct TodayBlocksView: View {
    
    @Binding var calendarToggle: Bool
    @Binding var fetusToggle: Bool
    @Binding var toDoToggle: Bool
    @Binding var weightToggle: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Today’s blocks")
                    .font(.title3)
                    .bold()
                Spacer()
            }
            .padding(.top, 5)
            .padding(.bottom, 10)
            
            VStack {
                HStack {
                    Toggle("Your calendar", isOn: $calendarToggle)
                        .font(.subheadline)
                        .toggleStyle(SwitchToggleStyle(tint: Color(uiColor: UIColor(red: 0.32, green: 0, blue: 1, alpha: 1))))
                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
            }
            VStack {
                HStack {
                    Toggle("What fetus is doing", isOn: $fetusToggle)
                        .font(.subheadline)
                        .toggleStyle(SwitchToggleStyle(tint: Color(uiColor: UIColor(red: 0.32, green: 0, blue: 1, alpha: 1))))
                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
            }
            VStack {
                HStack {
                    Toggle("To do", isOn: $toDoToggle)
                        .font(.subheadline)
                        .toggleStyle(SwitchToggleStyle(tint: Color(uiColor: UIColor(red: 0.32, green: 0, blue: 1, alpha: 1))))
                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
            }
            VStack {
                HStack {
                    Toggle("Your weight", isOn: $weightToggle)
                        .font(.subheadline)
                        .toggleStyle(SwitchToggleStyle(tint: Color(uiColor: UIColor(red: 0.32, green: 0, blue: 1, alpha: 1))))
                    Spacer()
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.5))
        .cornerRadius(30)
    }
}
