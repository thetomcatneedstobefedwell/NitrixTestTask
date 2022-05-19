import Foundation

class Favorites: ObservableObject {
    @Published var favouriteFilms: [FilmCard]
    let savePath = FileManager.documentsDirectory.appendingPathComponent("FavouritesFilms")
    static var count = 0

    init() {
        do {
            let data = try Data(contentsOf: savePath)
            favouriteFilms = try JSONDecoder().decode([FilmCard].self, from: data)
        } catch {
            favouriteFilms = []
        }
    }
    
    func add(filmCard: FilmCard) {
        if let index = favouriteFilms.firstIndex(where: {$0.id == filmCard.id}) {
            favouriteFilms.remove(at: index)
        } else {
            favouriteFilms.insert(filmCard, at: 0)
        }
        save()
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(favouriteFilms)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func getIds() -> [UInt] {
        return favouriteFilms.map { $0.id }
    }
}

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
