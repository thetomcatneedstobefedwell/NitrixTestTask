import SwiftUI
import UIKit

struct ContentView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color(red: 0.124, green: 0.123, blue: 0.129))
    }
    
    var body: some View {
        TabView {
            Feed()
                .tabItem {
                    Image(systemName: "list.bullet.circle.fill")
                    Text("Popular")
                }
            
//            Favourites()
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Favourites")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
