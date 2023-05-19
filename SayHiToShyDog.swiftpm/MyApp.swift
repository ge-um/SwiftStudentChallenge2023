import SwiftUI

@main
struct MyApp: App {
    init() {
            Font.registerFonts()
            for family in UIFont.familyNames{
                print(family)
                for names in UIFont.fontNames(forFamilyName: family){
                    print("== \(names)")
                }
            }
        }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
