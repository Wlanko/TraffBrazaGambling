//
//  GameViewModel.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 07.12.2022.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    var rouletteItems: [RouletteItemModel] = [];
    var bets: [[BetModel]] = [[],[],[]]
    var numberEndings: [String] = ["st", "nd", "rd"]
    var firebaseManager = FirebaseManager.shared;
    var wasSuccessfull: Bool = false
    @Published var userInfo: UserInfo = UserInfo(id: "0", name: "Test", balance: 2000, gamesPlayed: 0, gamesWon: 0)
    
    init() {
        setUpRouletteItems()
        setUpBets()
        getUserInfo()
    }
    
    func getUserInfo() {
        Task {
            do {
                userInfo = try await firebaseManager.getCurrentUserInfo()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func checkBet(number: Int, bet: BetModel, sum: Int) {
        userInfo.gamesPlayed += 1
        userInfo.balance -= sum
        wasSuccessfull = false
        
        let result = rouletteItems.first(where: {$0.id == number})!
        
        if bet.betColor == result.color {
            wasSuccessfull = true
        } else if bet.betNumbers.contains(result.number){
            wasSuccessfull = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            if wasSuccessfull{
                userInfo.gamesWon += 1
                userInfo.balance += sum * bet.winMultiplier
            }
            else if userInfo.balance < 10 {
                userInfo.balance += 100
            }
            
            firebaseManager.updateUserInfo(userInfo: userInfo)
            getUserInfo()
        }
    }
    
    func setUpBets() {
        setUpHalfs()
        setUpDozens()
        setUpRows()
    }
    
    func setUpHalfs() {
        bets[0].append(BetModel(title: "1 to 18", betNumbers: [], winMultiplier: 2))
        for i in 1...18 {
            bets[0][0].betNumbers.append(i)
        }
        bets[0].append(BetModel(title: "EVEN", betNumbers: [], winMultiplier: 2))
        for i in 1...36 {
            if i % 2 == 0 {
                bets[0][1].betNumbers.append(i)
            }
        }
        bets[0].append(BetModel(title: "RED", betNumbers: [], betColor: .red, winMultiplier: 2))
        bets[0].append(BetModel(title: "BLACK", betNumbers: [], betColor: .black, winMultiplier: 2))
        bets[0].append(BetModel(title: "ODD", betNumbers: [], winMultiplier: 2))
        for i in 1...36{
            if i % 2 == 1 {
                bets[0][4].betNumbers.append(i)
            }
        }
        bets[0].append(BetModel(title: "19 to 36", betNumbers: [], winMultiplier: 2))
        for i in 19...36 {
            bets[0][5].betNumbers.append(i)
        }
    }
    
    func setUpDozens() {
        for i in 0...2 {
            bets[1].append(BetModel(title: "\(i+1)\(numberEndings[i]) 12", betNumbers: [], winMultiplier: 3))
            for j in 1...12 {
                bets[1][i].betNumbers.append(j + (12 * i))
            }
        }
    }
    
    func setUpRows() {
        for i in 1...3 {
            bets[2].append(BetModel(title: "row", betNumbers: [], winMultiplier: 3))
            for j in 1...36 {
                if j % 3 == i % 3{
                    bets[2][i - 1].betNumbers.append(j)
                }
            }
        }
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
