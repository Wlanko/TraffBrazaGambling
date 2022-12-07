//
//  GameViewModel.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 07.12.2022.
//

import Foundation

class GameViewModel {
    var rouletteItems: [RouletteItemModel] = [];
    
    init() {
        setUpRouletteItems()
    }
    
    func setUpRouletteItems() {
        if rouletteItems.isEmpty{
            rouletteItems.append(RouletteItemModel(number: 0, id: -37, color: .green))
            rouletteItems.append(RouletteItemModel(number: 1, id: -36, color: .red))
            rouletteItems.append(RouletteItemModel(number: 2, id: -35, color: .black))
            rouletteItems.append(RouletteItemModel(number: 3, id: -34, color: .red))
            rouletteItems.append(RouletteItemModel(number: 4, id: -33, color: .black))
            rouletteItems.append(RouletteItemModel(number: 5, id: -32, color: .red))
            rouletteItems.append(RouletteItemModel(number: 6, id: -31, color: .black))
            rouletteItems.append(RouletteItemModel(number: 7, id: -30, color: .red))
            rouletteItems.append(RouletteItemModel(number: 8, id: -29, color: .black))
            rouletteItems.append(RouletteItemModel(number: 9, id: -28, color: .red))
            rouletteItems.append(RouletteItemModel(number: 10, id: -27, color: .black))
            rouletteItems.append(RouletteItemModel(number: 11, id: -26, color: .black))
            rouletteItems.append(RouletteItemModel(number: 12, id: -25, color: .red))
            rouletteItems.append(RouletteItemModel(number: 13, id: -24, color: .black))
            rouletteItems.append(RouletteItemModel(number: 14, id: -23, color: .red))
            rouletteItems.append(RouletteItemModel(number: 15, id: -22, color: .black))
            rouletteItems.append(RouletteItemModel(number: 16, id: -21, color: .red))
            rouletteItems.append(RouletteItemModel(number: 17, id: -20, color: .black))
            rouletteItems.append(RouletteItemModel(number: 18, id: -19, color: .red))
            rouletteItems.append(RouletteItemModel(number: 19, id: -18, color: .red))
            rouletteItems.append(RouletteItemModel(number: 20, id: -17, color: .black))
            rouletteItems.append(RouletteItemModel(number: 21, id: -16, color: .red))
            rouletteItems.append(RouletteItemModel(number: 22, id: -15, color: .black))
            rouletteItems.append(RouletteItemModel(number: 23, id: -14, color: .red))
            rouletteItems.append(RouletteItemModel(number: 24, id: -13, color: .black))
            rouletteItems.append(RouletteItemModel(number: 25, id: -12, color: .red))
            rouletteItems.append(RouletteItemModel(number: 26, id: -11, color: .black))
            rouletteItems.append(RouletteItemModel(number: 27, id: -10, color: .red))
            rouletteItems.append(RouletteItemModel(number: 28, id: -9, color: .black))
            rouletteItems.append(RouletteItemModel(number: 29, id: -8, color: .black))
            rouletteItems.append(RouletteItemModel(number: 30, id: -7, color: .red))
            rouletteItems.append(RouletteItemModel(number: 31, id: -6, color: .black))
            rouletteItems.append(RouletteItemModel(number: 32, id: -5, color: .red))
            rouletteItems.append(RouletteItemModel(number: 33, id: -4, color: .black))
            rouletteItems.append(RouletteItemModel(number: 34, id: -3, color: .red))
            rouletteItems.append(RouletteItemModel(number: 35, id: -2, color: .black))
            rouletteItems.append(RouletteItemModel(number: 36, id: -1, color: .red))
            rouletteItems.append(RouletteItemModel(number: 0, id: 0, color: .green))
            rouletteItems.append(RouletteItemModel(number: 1, id: 1, color: .red))
            rouletteItems.append(RouletteItemModel(number: 2, id: 2, color: .black))
            rouletteItems.append(RouletteItemModel(number: 3, id: 3, color: .red))
            rouletteItems.append(RouletteItemModel(number: 4, id: 4, color: .black))
            rouletteItems.append(RouletteItemModel(number: 5, id: 5, color: .red))
            rouletteItems.append(RouletteItemModel(number: 6, id: 6, color: .black))
            rouletteItems.append(RouletteItemModel(number: 7, id: 7, color: .red))
            rouletteItems.append(RouletteItemModel(number: 8, id: 8, color: .black))
            rouletteItems.append(RouletteItemModel(number: 9, id: 9, color: .red))
            rouletteItems.append(RouletteItemModel(number: 10, id: 10, color: .black))
            rouletteItems.append(RouletteItemModel(number: 11, id: 11, color: .black))
            rouletteItems.append(RouletteItemModel(number: 12, id: 12, color: .red))
            rouletteItems.append(RouletteItemModel(number: 13, id: 13, color: .black))
            rouletteItems.append(RouletteItemModel(number: 14, id: 14, color: .red))
            rouletteItems.append(RouletteItemModel(number: 15, id: 15, color: .black))
            rouletteItems.append(RouletteItemModel(number: 16, id: 16, color: .red))
            rouletteItems.append(RouletteItemModel(number: 17, id: 17, color: .black))
            rouletteItems.append(RouletteItemModel(number: 18, id: 18, color: .red))
            rouletteItems.append(RouletteItemModel(number: 19, id: 19, color: .red))
            rouletteItems.append(RouletteItemModel(number: 20, id: 20, color: .black))
            rouletteItems.append(RouletteItemModel(number: 21, id: 21, color: .red))
            rouletteItems.append(RouletteItemModel(number: 22, id: 22, color: .black))
            rouletteItems.append(RouletteItemModel(number: 23, id: 23, color: .red))
            rouletteItems.append(RouletteItemModel(number: 24, id: 24, color: .black))
            rouletteItems.append(RouletteItemModel(number: 25, id: 25, color: .red))
            rouletteItems.append(RouletteItemModel(number: 26, id: 26, color: .black))
            rouletteItems.append(RouletteItemModel(number: 27, id: 27, color: .red))
            rouletteItems.append(RouletteItemModel(number: 28, id: 28, color: .black))
            rouletteItems.append(RouletteItemModel(number: 29, id: 29, color: .black))
            rouletteItems.append(RouletteItemModel(number: 30, id: 30, color: .red))
            rouletteItems.append(RouletteItemModel(number: 31, id: 31, color: .black))
            rouletteItems.append(RouletteItemModel(number: 32, id: 32, color: .red))
            rouletteItems.append(RouletteItemModel(number: 33, id: 33, color: .black))
            rouletteItems.append(RouletteItemModel(number: 34, id: 34, color: .red))
            rouletteItems.append(RouletteItemModel(number: 35, id: 35, color: .black))
            rouletteItems.append(RouletteItemModel(number: 36, id: 36, color: .red))
            rouletteItems.append(RouletteItemModel(number: 0, id: 37, color: .green))
            rouletteItems.append(RouletteItemModel(number: 1, id: 38, color: .red))
        }
    }
}
