//
//  SettingsViewModel.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 04.12.2022.
//

import Foundation
import StoreKit
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var settingsItem: [SettingsItemModel]
    private let firebaseManager = FirebaseManager.shared
    
    init() {
        settingsItem = []
    }
    
    func createSettingsItems(){
        if settingsItem.count == 0 {
            
            settingsItem.append(SettingsItemModel(id: "1", image: "star.square", name: "Rate app") {
                SKStoreReviewController.requestReview()
            })
            settingsItem.append(SettingsItemModel(id: "2", image: "square.and.arrow.up", name: "Share app") {
                guard let urlShare = URL(string: "https://youtu.be/dQw4w9WgXcQ") else { return }
                let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
            })
            settingsItem.append(SettingsItemModel(id: "3", image: "rectangle.portrait.and.arrow.forward", name: "Log out") {
                self.firebaseManager.logOut()
            })
            settingsItem.append(SettingsItemModel(id: "4", image: "xmark.bin", name: "Delete account") {
                self.firebaseManager.deleteAccount()
            })
            
        }
    }
}
