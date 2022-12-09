//
//  ContentView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 01.12.2022.
//

import SwiftUI

struct MainView: View {
    private let firebaseManager = FirebaseManager.shared
    
    var body: some View {
        TabView {
            GameView()
                .tabItem{
                    Label("Game", systemImage: "timelapse")
                }
            RatingView()
                .tabItem{
                    Label("Rating", systemImage: "list.star")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            firebaseManager.getUsersRatingList()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
