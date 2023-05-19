//
//  speedometerView.swift
//  sayHiToShyDog
//
//  Created by 금가경 on 2023/04/09.

import SwiftUI

struct SpeedometerView: View {
    
    @State private var personOffset = CGSize.zero
    @State private var dogOffset = CGSize.zero
    @State private var lastDragPosition: DragGesture.Value?
    @State private var isFast = false
    @State private var showGuidingText = false
    @State private var speed : Double = 0.0
    
    @State var startTime: Date?
    @State var pauseTime: Date?
    @State var elapsedTime: TimeInterval = 0
    
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Image("Cloud")
                .offset(y: -380)
            Text("Move the human to get to the dog, \ntaking speed into account!")
                .multilineTextAlignment(.center)
                .font(.custom("IrishGrover-Regular", size : 36))
                .offset(y : -390)
                .foregroundColor(Color.black)
            HStack{
                Spacer()
                //dog
                Image("ApproachDog")
                    .resizable()
                    .frame(width: 180, height: 200)
                    .offset(dogOffset)
                Spacer()
                //person
                Image("Person")
                    .resizable()
                    .frame(width: 160, height: 200)
                    .offset(personOffset)
                    .gesture(DragGesture()
                        .onChanged ({ value in
                            self.personOffset = value.translation
                            self.lastDragPosition = value
                            if startTime == nil {
                                startTime = Date()
                            }
                        }).onEnded({ value in
                            showGuidingText = true
                            pauseTime = Date()
                            updateElapsedTime()
                            
                            let distance = sqrt(pow(value.location.x - value.startLocation.x, 2) + pow(value.location.y - value.startLocation.y, 2))
                            
                            speed = CGFloat(distance)/CGFloat(elapsedTime)
                            
                            if speed > 400 {
                                self.isFast = true
                                if dogOffset.width > -160 {
                                    dogOffset = CGSize(width: dogOffset.width - 80, height: dogOffset.height)
                                }
                            } else {
                                self.isFast = false
                                dogOffset = CGSize(width: dogOffset.width + 80, height: dogOffset.height)
                            }
                            self.personOffset = CGSize.zero
                        }))
                Spacer()
            }
            
            if dogOffset.width > 300 {
                ZStack {
                    Rectangle()
                        .ignoresSafeArea(.all)
                        .foregroundColor(Color.white.opacity(0.8))
                    VStack(spacing: -145){
                        HStack(spacing : 60){
                            Button(action : {
                                withAnimation {
                                    personOffset = CGSize.zero
                                    dogOffset = CGSize.zero
                                }
                            }, label : {
                                Image("ResumeButton")
                            })
                            Button(action: {
                            }) {
                                NavigationLink(destination: EyeContactView()) {
                                    Image("NextButton")
                                }
                            }
                        }
                    }
                }
            }
            if showGuidingText {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 250/225, green: 255/225, blue: 16/225))
                        .frame(width: 673, height: 240)
                        .cornerRadius(50)
                    Text(dogOffset.width > 300 ? "Always keep in mind that if you approach too quickly, you may spook the dog!" : speed > 400 ? "Move more slowly!" : "Keep going!")
                        .frame(width : 500, height : 200)
                        .font(.custom("IrishGrover-Regular", size : dogOffset.width > 300 ? 30 : 48))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                }
                .offset(y: 400)
            }
        }
    }
    func updateElapsedTime() {
        if let start = startTime, let pause = pauseTime {
            elapsedTime = pause.timeIntervalSince(start)
            startTime = nil
            pauseTime = nil
        }
    }
}

struct speedometerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedometerView()
    }
}
