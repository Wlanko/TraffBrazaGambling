//
//  UserModel.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 01.12.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct UserInfo: Identifiable, Codable {
    var id: String
    var name: String
    var balance: Int
    var gamesPlayed: Int
    var gamesWon: Int
}
