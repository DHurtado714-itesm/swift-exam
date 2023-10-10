import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MoviesViewModel()
    // Datos de muestra
//    var movie = (
//        title: "The Nun II",
//        releaseDate: "2023-09-06",
//        overview: "In 1956 France, a priest is violently murdered...",
//        voteAverage: 7.0,
//        voteCount: 776,
//        posterURL: URL(string: "https://image.tmdb.org/t/p/original/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg")
//    )
    
    var body: some View {
        VStack{
            Text("Lista de Peliculas")
            if viewModel.isLoading {
                Text("Esta cargando")
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else {
                List(viewModel.movies) {movie in
                    HStack {
                        if let posterPath = movie.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/original\(posterPath)") {
                            WebImage(url: url)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .clipped()
                        }
                        // Detalles
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.releaseDate)
                                .font(.subheadline)
                            Text(movie.overview)
                                .font(.caption)
                                .lineLimit(3)
                                .truncationMode(.tail)
                                .padding(.bottom, 10)
                            
                            HStack {
                                Text("Promedio: \(movie.voteAverage, specifier: "%.1f")")
                                Spacer()
                                Text("Votos: \(movie.voteCount)")
                            }
                            .font(.caption)
                        }
                        .padding(.leading, 5)
                    }
                }
            }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
