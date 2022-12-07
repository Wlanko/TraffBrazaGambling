//
//  GameView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 03.12.2022.
//

import SwiftUI

struct GameView: View {
    var gameViewModel = GameViewModel()
    @State var xOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            GeometryReader() { geometry in
                let size = geometry.size.width
                
                ScrollViewReader { scrollView in
                    VStack(alignment: .center){
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .top) {
                                ForEach(gameViewModel.rouletteItems, id: \.id) { i in
                                    Text("\(i.number)")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 60, height: 60)
                                        .background(i.color)
                                        .id(i.id)
                                }
                                
                            }
                            .offset(x: xOffset, y: 0)
                        }
                        .frame(width: 340)
                        .scrollDisabled(true)
                        
                        Spacer()
                        
                        Button("Spin") {
                            let random = Int.random(in: 0...36)
                            print(random)
                            spin()
                            withAnimation(){
                                //xOffset = 0
                                scrollView.scrollTo(random, anchor: .center )
                            }
                        }
                    }
                }
                .navigationTitle("Game")
                .navigationBarTitleDisplayMode(.inline)
                .frame(width: geometry.size.width)
            }
        }
    }
    
    func spin() {
        withAnimation(.linear(duration: 0.5).repeatCount(5, autoreverses: false)) {
            xOffset = -340 * 4
        }
        xOffset = 0
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
