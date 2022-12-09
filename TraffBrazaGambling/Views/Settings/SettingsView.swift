//
//  SettingsView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 03.12.2022.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject private var settingsViewModel = SettingsViewModel()
    private var count = 0
    
    var body: some View {
        NavigationView {
            List{
                ForEach(settingsViewModel.settingItems) { section in
                    Section{
                        ForEach(section.itemModel) { item in
                            SettingsItemCell(item: item)
                        }
                    }
                }
            }
            .background(Color(.lightGray))
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            
//            NavigationLink(destination: LogInView(), isActive: $settingsViewModel.popToMainView, label: {EmptyView()})
        }
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
