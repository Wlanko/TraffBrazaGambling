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
                Section{
                    ForEach(settingsViewModel.settingsItem){ item in
                        if Int(item.id)! < settingsViewModel.settingsItem.count - 1 {
                            SettingsItemCell(item: item)
                        }
                    }
                }
                Section{
                    ForEach(settingsViewModel.settingsItem){ item in
                        if Int(item.id)! > settingsViewModel.settingsItem.count - 2 {
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
