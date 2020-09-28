//
//  MainView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import SwiftUI


struct MainView: View {
    @ObservedObject var viewModel: MovieViewModel

    init(viewModel: MovieViewModel = MovieViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.imdbId) { movie in
                Cell(movie: movie)
                    .padding(10)
                    .background(Color(.systemBackground))
            }.navigationBarTitle("Movies")
        }
    }
}

struct Cell: View {
    var movie: MovieSearch

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(movie.year)
            }
            Spacer()
            if let data = movie.imageData, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .clipped()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MovieViewModel()
        viewModel.movies = [
            MovieSearch(title: "Blade", year: "1997", imdbId: "gsafhsanjk", type: .movie, poster: "https://m.media-amazon.com/images/M/MV5BOWVjZTIzNDYtNTBlNC00NTJjLTkzOTEtOTE0MjlhYzI2YTcyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"),
            MovieSearch(title: "Iron man", year: "2010", imdbId: "asdgsafhsanjk", type: .movie, poster: "")
        ]
        return MainView(viewModel: viewModel).colorScheme(.dark)
    }
}
