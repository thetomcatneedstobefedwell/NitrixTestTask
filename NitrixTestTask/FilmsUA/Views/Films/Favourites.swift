import SwiftUI

struct Favourites: View {
    @EnvironmentObject var favoritesFilms: Favorites
    @State private var films: [FilmCard] = []
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        NavigationView {
            if favoritesFilms.favouriteFilms.isEmpty {
                VStack {
                    Rectangle()
                        .background(Color(red: 0.124, green: 0.123, blue: 0.129))
                        .overlay(
                            Text("There is nothing to show.")
                                .foregroundColor(.white)
                        )
                        .navigationBarTitle("Favourites")
                }
            } else {
                VStack {
                    ZStack {
                        
                    }
                    .frame(height: 5)
                    .background(Color(red: 0.124, green: 0.123, blue: 0.129))
                    
                    GeometryReader { view in
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(favoritesFilms.favouriteFilms, id: \.id) { film in
                                    VStack {
                                        NavigationLink {
                                            FilmDetails(id: film.id, isFavourite: isFavourite(film: film))
                                        } label: {
                                            FilmRow(film: film)
                                        }
                                    }
                                    .contextMenu {
                                        Button(action: {
                                            favoritesFilms.add(filmCard: film)
                                        }, label: {
                                            if isFavourite(film: film) {
                                                Label("Remove from favourites", systemImage: "minus.circle.fill")
                                            } else {
                                                Label("Add to favourites", systemImage: "heart.fill")
                                            }
                                        })
                                    }
                                }
                            }
                            .frame(minHeight: view.size.height, alignment: .top)
                            .background(Color.black)
                        }
                    }
                    
                    
                }
                .background(Color(red: 0.124, green: 0.123, blue: 0.129))
                .navigationBarTitle("Favourites")
            }
        }
    }
    
    func isFavourite(film: FilmCard) -> Bool {
        return favoritesFilms.getIds().contains(film.id)
    }
}

//struct Favourites_Previews: PreviewProvider {
//    static var previews: some View {
//        Favourites()
//            .environmentObject(Favorites())
//    }
//}
