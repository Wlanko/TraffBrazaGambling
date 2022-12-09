//
//  SettingsItemModel.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 04.12.2022.
//

import Foundation

struct SettingsItemModel: Identifiable {
    let id: String
    let image: String
    let name: String
    let action: () -> Void
    
    let chevronimage = "chevron.right"
}

struct SettingsSectionModel: Identifiable {
    let id = UUID().uuidString
    var itemModel: [SettingsItemModel]
}
