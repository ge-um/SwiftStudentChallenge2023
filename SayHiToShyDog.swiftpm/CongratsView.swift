//
//  CongratsView.swift
//  sayHiToShyDog
//
//  Created by 금가경 on 2023/04/15.
//

import SwiftUI

struct CongratsView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 145) {
                ZStack {
                    Image("Cloud")
                        .offset(y: -100)
                    Text("Congratulations,\n you've successfully greeted a shy dog!")
                        .font(.custom("IrishGrover-Regular", size : 30))
                        .offset(y: -110)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                }
                ZStack{
                    Image("GreetingDog")
                        .resizable()
                        .frame(width : 300, height: 460)
                        .offset(y: -160)
                    Rectangle()
                        .fill(Color(red: 250/225, green: 255/225, blue: 16/225))
                        .frame(width: 673, height: 350)
                        .cornerRadius(50)
                        .offset(y: 130)
                    Text("However, it's important to always watch your dog's reaction. Avoiding eye contact, fur standing up, tail lowered, or teeth bared are signs that the dog is wary of you. \nUse these guidelines to greet a strange dog!")
                        .frame(width : 500, height : 300)
                        .font(.custom("IrishGrover-Regular", size : 30))
                        .multilineTextAlignment(.center)
                        .offset(y: 130)
                        .foregroundColor(Color.black)
                }
            }
            
        }
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView()
    }
}
