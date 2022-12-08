//
//  GameView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 03.12.2022.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameViewModel = GameViewModel()
    @State var xOffset: CGFloat = 0
    @State var bet: Int = 0
    @State var range = 1...3
    @State var finalBet: BetModel = BetModel(title: "title", betNumbers: [], betColor: .gray, winMultiplier: 0)
    
    @State var showBetAlert: Bool = false
    @State var showBalanceAlert: Bool = false
    
    
    var body: some View {
        NavigationView {
            GeometryReader() { geometry in
                ScrollViewReader { scrollView in
                    VStack(alignment: .center){
                        PlayerRatingCell(userInfo: gameViewModel.userInfo)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .top) {
                                ForEach(gameViewModel.rouletteItems, id: \.id) { i in
                                    RouletteItemPattern(item: i, frameSize: 60)
                                }
                            }
                            .offset(x: xOffset, y: 0)
                        }
                        .frame(width: 330)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 340, height: 70)
                                .overlay(){
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.green, lineWidth: 3)
                                        .frame(width: 70, height: 70)
                                }
                        )
                        .scrollDisabled(true)
                        
                        Spacer()
                        HStack{
                            
                            GameBetPicker(finalBet: $finalBet)
                                .padding(.top, 5)
                                .padding([.leading, .bottom])
                            Spacer()
                            VStack{
                                VStack{
                                    Text("BET")
                                    Stepper(value: $bet,
                                            in: 0...gameViewModel.userInfo.balance,
                                            step: gameViewModel.userInfo.balance / 10,
                                            label: {
                                        Text("Bet: \(bet)")
                                    })
                                    .background(Color(.systemGreen))
                                    .cornerRadius(10)
                                    .labelsHidden()
                                    Text("\(bet)")
                                }
                                
                                Spacer()
                                
                                Button("Spin") {
                                    if(finalBet.betNumbers.isEmpty && finalBet.betColor == .gray || bet == 0) {
                                        showBetAlert = true
                                        return
                                    }
                                    
                                    let random = Int.random(in: 0...36)
                                    
                                    print(random)
                                    spin()
                                    withAnimation(){
                                        scrollView.scrollTo(random, anchor: .center )
                                    }
                                    
                                    
                                    gameViewModel.checkBet(number: random, bet: finalBet, sum: bet)
                                    bet = 0
                                }
                                .frame(width: 70, height: 40)
                                .background(Color(.systemGreen))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .alert(isPresented: $showBetAlert) {
                                    Alert(title: Text("Ups"), message: Text("Plese make a bet"), dismissButton: .default(Text("Ok")))
                                }
                                
                            }
                            .padding()
                        }
                    }
                }
                
            }
            .frame(height: 720)
            .onAppear(){
                gameViewModel.getUserInfo()
            }
        }
    }
    
    func spin() {
        withAnimation(.linear(duration: 0.5).repeatCount(10, autoreverses: false)) {
            xOffset = -330 * 4
        }
        xOffset = 0
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
