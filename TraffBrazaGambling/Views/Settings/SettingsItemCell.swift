//
//  SettingsItemCell.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 04.12.2022.
//

import SwiftUI

struct SettingsItemCell: View {
    let item: SettingsItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.image)
            Text(item.name)
            Spacer()
            Image(systemName: item.chevronimage)
                .foregroundColor(.blue)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            item.action()
        }
    }
}

struct SettingsItemCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsItemCell(item: SettingsItemModel(id: "0", image: "gearshape", name: "Item", action: { print("ItemSelected")}))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
