//
//  eyeContactView.swift
//  sayHiToShyDog
//
//  Created by 금가경 on 2023/04/09.
//

import SwiftUI

struct EyeContactView: View {
    @State private var degrees = -60.0
    @State private var showGuidingText = false
    @State private var isNextViewPresented = false
    
    var body: some View {
        ZStack {
            VStack(spacing : 0) {
                Rectangle()
                    .fill(Color(red: 45/225, green: 205/225, blue: 255/225))
                    .edgesIgnoringSafeArea(.all)
                    .frame(height : 600 + degrees * -0.3)
                Color(red: 22/225, green: 239/225, blue: 18/225)
                    .edgesIgnoringSafeArea(.all)
            }
            HStack {
                Image("EyeContactWithDog")
                    .resizable()
                    .frame(width : 500, height: 425)
                    .rotation3DEffect(.degrees(degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
                    .offset(x: 120, y : degrees * -2)
                Slider(value: $degrees, in: -60...10, step: 1.0)
                    .offset(y: -90)
                    .rotationEffect(.degrees(90))
            }
            .frame(width: 834, height: 1194)
            Image("Cloud")
                .offset(y: -380 + degrees * -2)
            Text("Slide the bar and \n Make Eye Contact!")
                .font(.custom("IrishGrover-Regular", size : 40))
                .offset(y : -390 + degrees * -2)
                .foregroundColor(Color.black)
            if showGuidingText {
                ZStack {
                    Rectangle()
                        .ignoresSafeArea(.all)
                        .foregroundColor(Color.white.opacity(0.8))
                    HStack(spacing : 60){
                        Button(action : {
                            withAnimation {
                                degrees = -60
                            }
                        }, label : {
                            Image("ResumeButton")
                        })
                        NavigationLink(destination: PetYourDogView()) {
                            Image("NextButton")
                        }
                    }
                }
            }
            //guidingText
            ZStack{
                if showGuidingText {
                    Rectangle()
                        .fill(Color(red: 250/225, green: 255/225, blue: 16/225))
                        .frame(width: 673, height: 240)
                        .cornerRadius(50)
                    Text("Always remember that \n you should kneel down to the dog’s level!")
                        .frame(width : 600, height : 200)
                        .font(.custom("IrishGrover-Regular", size : 30))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                }
            }
            .offset(y: 400)
            .onChange(of: degrees) { degree in
                if degree == 10 {
                    showGuidingText = true
                }
                else {
                    showGuidingText = false
                }
            }
            
        }
    }
}
struct EyeContactView_Previews: PreviewProvider {
    static var previews: some View {
        EyeContactView()
    }
}
