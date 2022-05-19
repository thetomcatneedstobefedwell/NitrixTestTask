import SwiftUI

struct FilmRow: View {
    @EnvironmentObject var favoritesFilms: Favorites
    let film: FilmCard
    
    var body: some View {
        VStack(alignment: .leading) {
            if film.poster_path != nil {
                let imageUrl: String = pathToImage + film.poster_path!
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
                .padding(.top, 8.0)
            }
            if film.title != nil {
                Text(film.title!)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
            if film.vote_average != nil {
                HStack {
                    StarsView(rating: (film.vote_average! / 2), frame: 12)
                        .font(.caption)
                    Text(String(film.vote_average!))
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                }
                .padding(.top, -10)
                .font(.callout)
            }
        }
        .padding()
    }
}
