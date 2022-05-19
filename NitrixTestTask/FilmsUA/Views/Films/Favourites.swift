import SwiftUI

//struct Favourites: View {
//    @State var favouriteFilms: [FilmCard] = []
//    var id: UInt
//
//    var body: some View {
//        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(favouriteFilms, id: \.id) { film in
//                        NavigationLink {
//                            FilmDetails(id: film.id)
//                        } label: {
//                            FilmRow(film: film)
//                        }
//                    }
////                    .onAppear() {
////                        getFilmDetails(id: self.id) { (favouriteFilms) in
////                            self.favouriteFilms = [favouriteFilms]
////                        }
////                    }
//                }
//            }
//        }
//    }
//}
//
//struct Favourites_Previews: PreviewProvider {
//    static var previews: some View {
//        Favourites(id: 500)
//    }
//}
