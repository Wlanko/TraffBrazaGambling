//
//  PlayerRatingCell.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 03.12.2022.
//

import SwiftUI

struct PlayerRatingCell: View {
    var userInfo: UserInfo
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .padding(.leading, 10)
            Text(userInfo.name)
                .font(.system(size: 25))
            Spacer()
            Text("\(userInfo.balance)")
                .font(.system(size: 30))
                .foregroundColor(.yellow)
                //.padding(.trailing, 10)
            Image(systemName: "bitcoinsign.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .foregroundColor(.yellow)
                .padding(.trailing, 10)
        }
    }
}

struct PlayerRatingCell_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRatingCell(userInfo: UserInfo(id: "someId", name: "Name", balance: 2000, gamesPlayed: 0, gamesWon: 0))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
