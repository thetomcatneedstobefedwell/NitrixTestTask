import Foundation

protocol ListOfFilms: Codable {
    static var page: UInt { get }
    var results: Array<FilmCard> { get }
}

struct FilmList: ListOfFilms {
    static var page: UInt = 1
    var results: Array<FilmCard>
}

struct SimilarFilmList: ListOfFilms {
    static var page: UInt = 1
    var results: Array<FilmCard>
}

struct SearchedList: ListOfFilms {
    static var page: UInt = 1
    var results: Array<FilmCard>
}
