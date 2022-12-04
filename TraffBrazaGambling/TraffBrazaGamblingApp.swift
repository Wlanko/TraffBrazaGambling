//
//  TraffBrazaGamblingApp.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 01.12.2022.
//

import SwiftUI
import FirebaseCore
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TraffBrazaGamblingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if(Auth.auth().currentUser != nil) {
                MainView()
            } else {
                LogInView()
            }
            //LogInView()
        }
    }
}
