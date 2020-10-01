//
//  MovieList.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-29.
//

import SwiftUI

struct MovieList: View {
    @ObservedObject var viewModel: MovieViewModel

    var onLastcell: () -> Void

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.movies, id: \.imdbId) { movie in
                    NavigationLink(destination: NavigationLazyView(DetailsView.create(with: movie))) {
                        MovieCell(movie: movie)
                            .onAppear {
                                if self.viewModel.movies.last == movie {
                                    onLastcell()
                                }
                            }
                    }.foregroundColor(Color(.label))
                    
                    Divider().background(Color(.systemGray))
                }
            }
        }.padding(.horizontal, 15)
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MovieViewModel()
        viewModel.movies = [
            MovieSearch(title: "Blade", year: "1997", imdbId: "gsafhsanjk", type: .movie, poster: "https://m.media-amazon.com/images/M/MV5BOWVjZTIzNDYtNTBlNC00NTJjLTkzOTEtOTE0MjlhYzI2YTcyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"),
            MovieSearch(title: "Iron man", year: "2010", imdbId: "asdgsafhsanjk", type: .movie, poster: "")
        ]

        return MovieList(viewModel: viewModel, onLastcell: { })
    }
}
