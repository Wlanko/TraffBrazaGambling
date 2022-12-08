//
//  GameBetPicker.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 08.12.2022.
//

import SwiftUI

struct GameBetPicker: View {
    @ObservedObject var gameViewModel = GameViewModel()
    @State var xOffset: CGFloat = 0
    @State var bet: Int = 0
    @State var range = 1...3
    @Binding var finalBet: BetModel
    
    
    var body: some View {
        ScrollView(){
            VStack{
                HStack{
                    Spacer()
                    Button("ZERO") {
                        finalBet = BetModel(title: "ZERO", betNumbers: [0], winMultiplier: 50)
                    }
                    .foregroundColor(.black)
                    .frame(width: 123, height: 40)
                    .cornerRadius(10)
                    .background(Color.green)
                    .cornerRadius(5)
                    .padding(-3)
                }
                .frame(width: 230)
                
                HStack{
                    VStack{
                        ForEach(gameViewModel.bets[0], id: \.title){ bet in
                            Button(bet.title) {
                                finalBet = bet
                            }
                            .foregroundColor(.black)
                            .frame(width: 55, height: 82)
                            .cornerRadius(10)
                            .rotationEffect(Angle(degrees: 90))
                            .background(Color.green)
                            .padding(-3)
                        }
                    }
                    VStack{
                        ForEach(gameViewModel.bets[1], id: \.title){ bet in
                            Button(bet.title) {
                                finalBet = bet
                            }
                            .foregroundColor(.black)
                            .frame(width: 55, height: 166)
                            .cornerRadius(5)
                            .rotationEffect(Angle(degrees: 90))
                            .background(Color.green)
                            .padding(-3)
                        }
                    }
                    ForEach(range, id: \.self) { i in
                        VStack{
                            ForEach(gameViewModel.rouletteItems, id: \.id) { item in
                                if(item.id % 3 == i % 3 && item.id > 0 && item.id < 37) {
                                    RouletteItemPattern(item: item, frameSize: 40)
                                        .padding(-3)
                                        .onTapGesture{
                                            finalBet = BetModel(title: "Number", betNumbers: [item.number], winMultiplier: 35)
                                        }
                                }
                            }
                        }
                        
                    }
                }
                .frame(width: 250)
                
                HStack{
                    Spacer()
                    ForEach(range, id: \.self) { i in
                        Button(gameViewModel.bets[2][i-1].title) {
                            
                        }
                        .foregroundColor(.black)
                        .frame(width: 40, height: 30)
                        .background(Color.green)
                        .cornerRadius(5)
                        .padding(-3)
                    }
                }
                .frame(width: 230)
            }
        }
        .scrollDisabled(true)
    }
}

struct GameBetPicker_Previews: PreviewProvider {
    static var previews: some View {
        GameBetPicker(finalBet: .constant(BetModel(title: "title", betNumbers: [-1], winMultiplier: 0)))
    }
}
