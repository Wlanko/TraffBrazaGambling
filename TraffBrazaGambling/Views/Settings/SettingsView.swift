//
//  SettingsView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 03.12.2022.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject private var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(settingsViewModel.settingItems, id: \.count) { section in
                    Section{
                        ForEach(section) { item in
                            SettingsItemCell(item: item)
                        }
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .onAppear(){
            settingsViewModel.createSettingsItems()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
