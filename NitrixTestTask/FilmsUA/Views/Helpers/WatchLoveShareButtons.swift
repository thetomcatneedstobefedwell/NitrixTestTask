import SwiftUI

struct WatchLoveShareButtons: View {
    @EnvironmentObject var favoritesFilms: Favorites

    var filmCard: FilmCard
    var isFavourite: Bool
    
    var body: some View {
        HStack(spacing: 60) {
            ZStack {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color(red: 0.109, green: 0.108, blue: 0.119))
                    .blur(radius: 1)
                Image(systemName: "eye")
                    .foregroundColor(.blue)
                    .font(.title2)
            }
            
            Button {
                favoritesFilms.add(filmCard: filmCard)
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(red: 0.109, green: 0.108, blue: 0.119))
                        .blur(radius: 1)
                    Image(systemName: isFavourite ? "heart.fill" : "heart")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
            }
            
            ZStack {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color(red: 0.109, green: 0.108, blue: 0.119))
                    .blur(radius: 1)
                Image(systemName: "arrowshape.turn.up.right")
                    .foregroundColor(.blue)
                    .font(.title2)
            }
        }
        .padding()
    }
}
