import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .ignoresSafeArea(.all)
                .frame(width: 600, height: 1000)
                .foregroundColor(Color.white.opacity(0.8))
            VStack(spacing: -140) {
                Text("When people think of a dog, they usually think of a bright, people-loving, tail-wagging dog that will come to you first.\n\nBut here's a shy dog. This dog doesn't come up to you first, looks away when you first meet him, and even barks when you get close. Is this a scary, incomprehensible dog?\n\nNo. The dog was already giving you signals, you just didn't realize it. Can you say hello to this dog and get to know it? Let me help you, and let's say hello to the dog!")
                    .frame(width: 500, height: 1000)
                    .font(.custom("IrishGrover-Regular", size : 30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
            
                NavigationLink(destination: SpeedometerView()) {
                    Image("NextButton")
                }
            }
            .offset(y : -120)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
