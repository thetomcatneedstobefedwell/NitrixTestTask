import SwiftUI

@main
struct FilmsUAApp: App {
    
    @StateObject var favoritesFilms = Favorites()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesFilms)
        }
    }
}
