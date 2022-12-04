//
//  RatingView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 03.12.2022.
//

import SwiftUI

struct RatingView: View {
    @ObservedObject private var firebaseManager = FirebaseManager.shared
    
    var body: some View {
        NavigationView{
            List(firebaseManager.users, id: \.id){ userInfo in
                PlayerRatingCell(userInfo: userInfo)
            }
        }
        .onAppear(){
            self.firebaseManager.getUsersRatingList()
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
