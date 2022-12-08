//
//  RouletteItemPattern.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 08.12.2022.
//

import SwiftUI

struct RouletteItemPattern: View {
    var item: RouletteItemModel
    var frameSize: CGFloat
    var body: some View {
        Text("\(item.number)")
            .font(.title)
            .foregroundColor(.white)
            .frame(width: frameSize, height: frameSize)
            .background(item.color)
            .id(item.id)
            .cornerRadius(5)
    }
}

struct RouletteItemPattern_Previews: PreviewProvider {
    static var previews: some View {
        RouletteItemPattern(item: RouletteItemModel(number: 1, id: 1, color: .black), frameSize: 60)
    }
}
