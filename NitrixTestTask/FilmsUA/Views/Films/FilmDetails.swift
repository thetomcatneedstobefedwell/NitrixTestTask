import SwiftUI

struct FilmDetails: View {
    @State var film: [FilmDetail] = []
    var filmCard: FilmCard {
        FilmCard(id: film[0].id, poster_path: film[0].poster_path, title: film[0].title, vote_average: film[0].vote_average)
    }

    var id: UInt
    var isFavourite: Bool
    
    func stringDateToYear(date: String) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date!)
    }
    
    var body: some View {
        ScrollView {
            ForEach(film, id: \.id) { details in
                ZStack(alignment: .topTrailing) {
                    ZStack(alignment: .bottomLeading) {
                        if details.poster_path != nil {
                            let imageUrl: String = pathToImage + details.poster_path!
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                ProgressView()
                            }
                            ShadowEffect()
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            PlayButton()
                            
                            if details.title != nil {
                                Text(details.title!)
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                            }
                            
                            HStack {
                                if details.genres != nil && details.genres!.count > 0 {
                                    Text(details.genres![0].name + ",")
                                        .font(.title3)
                                }
                                Text(stringDateToYear(date: details.release_date!))
                                    .font(.title3)
                            }
                            .foregroundColor(Color(red: 0.671, green: 0.665, blue: 0.689))
                        }
                        .padding(.horizontal, 25)
                        .padding(.bottom, 25)
                    }
                    BackButton()
                        .padding(.top, 25)
                        .padding(.trailing, 35)
                }
                
                VStack {
                    Button(action: {
                        //
                    }) {
                        Text("Watch movie")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(20)
                            .padding(.horizontal, 90)
                        
                    }
                    .clipShape(Rectangle())
                    .background(Color.blue)
                    .cornerRadius(30)
                    
                    WatchLoveShareButtons(filmCard: filmCard, isFavourite: isFavourite)
                }
                
                HStack(spacing: 100) {
                    StarsView(rating: (details.vote_average! / 2), frame: 25)
                        .font(.title2)
                    if details.vote_average != nil{
                        Text(String(details.vote_average!))
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                            .font(.title2)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(Color(red: 0.109, green: 0.108, blue: 0.119))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    if details.overview != nil {
                        ExpandableText(details.overview!, lineLimit: 9)
                            .foregroundColor(Color(red: 0.702, green: 0.702, blue: 0.702))
                    }
                }
                .padding(35.0)
                
                VStack {
                    HStack(spacing: 90) {
                        Text("Similar films")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Button(action: {
                            //
                        }) {
                            Text("See All")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                    SimilarFilms(id: self.id, isFavourite: isFavourite)
                        .padding(.leading, 20)
                        .padding(.top, -15)
                }
                
                AppreciateTheMovie()
            }
            .navigationBarHidden(true)
        }
        .onAppear() {
            getFilmDetails(id: self.id) { (film) in
                self.film = [film]
            }
        }
        .background(Color.black)
    }
}

//struct FilmDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        FilmDetails(id: 550, isFavourite: false)
//    }
//}
