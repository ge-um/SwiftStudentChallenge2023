//
//  petYourDogView.swift
//  sayHiToShyDog
//
//  Created by 금가경 on 2023/04/06.
//

import SwiftUI

struct PetYourDogView: View {
    @State private var scale: CGFloat = 1.0
    @State private var guidingColor: Color = .clear
    @State private var guidingText: String = ""
    @State private var showButton: Bool = true
    
    
    private let maxScale: CGFloat = 2.0
    private let minScale: CGFloat = 0.5
    private let weight: [CGFloat] = [0.9, 0.6, 1.1, 1.3, 1.2, 0.7]
    
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Image("Cloud")
                .offset(y: -380)
            Text("Touch the part you want and \nsee if she come closer or away!")
                .font(.custom("IrishGrover-Regular", size : 36))
                .offset(y : -390)
                .foregroundColor(Color.black)
            Image("PetYourDog")
                .scaleEffect(scale)
            HStack{
                //head
                Button(action: {
                    withAnimation {
                        scale *= weight[0]
                        scale = max(minScale, scale)
                        guidingColor = weight[0] > 1 ? .blue : .red
                        guidingText = "You might want to touch a dog's head,\nBut surprisingly, most dogs don't like it!"
                    }
                }, label: {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 230 * scale)
                    
                })
                .offset(x: 490 * scale, y: -100 * scale)
                
                //tail
                Button(action: {
                    withAnimation {
                        scale *= weight[1]
                        scale = max(minScale, scale)
                        guidingColor = weight[1] > 1 ? .blue : .red
                        guidingText = "That's not a good choice..\nperhaps every dogs don't like it!"
                    }
                }, label: {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 150 * scale)
                })
                .offset(x: 620 * scale, y: -135 * scale)
                
                //belly
                Button(action: {
                    withAnimation {
                        scale *= weight[2]
                        scale = min(maxScale, scale)
                        guidingColor = weight[2] > 1 ? .blue : .red
                        guidingText = "If you approach slowly,\nShe might even let you touch his belly!"
                    }
                }, label: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 265 * scale, height: 145 * scale)
                })
                .offset(x: 305 * scale, y: 80 * scale)
                
                //back
                Button(action: {
                    withAnimation {
                        scale *= weight[3]
                        scale = min(maxScale, scale)
                        guidingColor = weight[3] > 1 ? .blue : .red
                        guidingText = "Back could be a best choice!"
                    }
                }, label: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 265 * scale, height: 60 * scale)
                })
                .offset(x: 35 * scale, y: -22 * scale)
                
                //neck
                Button(action: {
                    withAnimation {
                        scale *= weight[4]
                        scale = min(maxScale, scale)
                        guidingColor = weight[4] > 1 ? .blue : .red
                        guidingText = "Neck could be a best choice! \nLet them smell your hand,\nand gently stroke their neck!"
                    }
                }, label: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 140 * scale, height: 140 * scale)
                })
                .offset(x: -375 * scale, y: 80 * scale)
                
                //legs
                Button(action: {
                    withAnimation {
                        scale *= weight[5]
                        scale = max(minScale, scale)
                        guidingColor = weight[5] > 1 ? .blue : .red
                        guidingText = "Hmm.. It's the worst choice!"
                    }
                }, label: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 405 * scale, height:80 * scale)
                })
                .offset(x: -525 * scale, y: 190 * scale)
                
            }
            
            //guidingText
            ZStack{
                Rectangle()
                    .fill(guidingColor)
                    .frame(width: 673, height: 240)
                    .cornerRadius(50)
                Text(guidingText)
                    .font(.custom("IrishGrover-Regular", size : 30))
                    .frame(width : 600, height : 200)
                    .foregroundColor(Color.white)
            }
            .offset(y: 400)
            
            //moveToNext
            if scale >= 2.0 {
                ZStack {
                    Rectangle()
                        .ignoresSafeArea(.all)
                        .foregroundColor(Color.white.opacity(0.8))
                    VStack(spacing : -145){
                        HStack(spacing : 60){
                            Button(action : {
                                withAnimation {
                                    showButton.toggle()
                                    scale = 1.0
                                    guidingColor = .clear
                                    guidingText = ""
                                }
                            }, label : {
                                Image("ResumeButton")
                            })
                            Button(action: {
                            }) {
                                NavigationLink(destination: CongratsView()) {
                                    Image("NextButton")
                                }
                            }
                        }
                        ZStack {
                            Rectangle()
                                .fill(Color(red: 250/225, green: 255/225, blue: 16/225))
                                .frame(width: 673, height: 240)
                                .cornerRadius(50)
                            Text("One of the most important things \nto keep in mind when petting dogs is \nto let the dog tell you what it likes \nby paying attention to its behavior!")
                                .frame(width : 500, height : 200)
                                .font(.custom("IrishGrover-Regular", size : 30))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.black)
                        }
                        .offset(y: 400)
                    }
                }
            }
        }
    }
    
    struct petYourDogView_Previews: PreviewProvider {
        static var previews: some View {
            PetYourDogView()
        }
    }
}
