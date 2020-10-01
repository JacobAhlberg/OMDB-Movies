//
//  MainView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import SwiftUI


struct MainView: View {
    @ObservedObject var viewModel: MovieViewModel

    @State var searchText: String = ""

    init(viewModel: MovieViewModel = MovieViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText,
                          placeHolder: "Search...",
                          searchButtonClicked: {
                            viewModel.search(by: searchText)
                          })
                    .padding(.horizontal, 8)

                MovieList(viewModel: viewModel, onLastcell: {
                    self.viewModel.fetchNextPage()
                }).edgesIgnoringSafeArea(.bottom)

                if viewModel.isLoading {
                    ProgressView()
                }
            }.navigationBarTitle("Movies")
        }.accentColor(Color(.label))
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
