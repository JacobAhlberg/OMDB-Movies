//
//  DetailsView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-29.
//

import SwiftUI



struct DetailsView: View {
    private var viewModel: MovieDetailViewModel

    init(movie: MovieSearch) {
        viewModel = MovieDetailViewModel(movie: movie)
    }

    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Unwrap(viewModel.movie) { movie in
                BackgroundView(image: viewModel.moviePoster)
                VStack {
                    Text("")
                }
            }
            if viewModel.isLoading {
                ProgressView()
            }
        }.navigationTitle(viewModel.movieTitle)
    }
}

struct DetailsView_Preview: PreviewProvider {
    static var previews: some View {
        let viewModel = MovieDetailViewModel()
        viewModel.movie = Movie(title: "Lego Marvel Super Heroes",
                                year: "2013",
                                rated: "E10+",
                                released: "22 Oct 2013",
                                runtime: "N/A",
                                genre: "Action, Adventure, Family, Sci-Fi",
                                director: "N/A",
                                writer: "Arthur Parsons (story), Stephen Sharples (story), Jonathan Smith (story), Mark Hoffmeier (script), Wil Evans (additional dialogue), Toby Everett (additional dialogue), Joe Moore (additional dialogue), Dewi Roberts (additional dialogue), Rob Liefeld (character created by: Deadpool), Fabian Nicieza (character created by: Deadpool), Todd McFarlane (character created by: Venom), David Michelinie (character created by: Venom), David Michelinie (character created by: Carnage), Mark Bagley (character created by: Carnage), Bill Mantlo (character created by: Rocket Raccoon), Keith Giffen (character created by: Rocket Raccoon), Jim Starlin (character created by: Drax the Destroyer), Jim Starlin (characters created by: Gamora & Thanos), Walter Simonson (characters created by: Malekith & Beta Ray Bill), Ole Kirk Christiansen (based on: LEGO Construction Toys), Godtfred Kirk Christiansen (based on: LEGO Construction Toys), Jens Nygaard Knudsen (based on: LEGO Construction Toys)",
                                actors: "Adrian Pasdar, Andrew Kishino, Clark Gregg, Danielle Nicolet",
                                plot: "Whilst visiting Earth to herald the arrival of Galactus the Silver Surfer is attacked by Dr Doom, causing his surfboard to be destroyed, scattering pieces all over the world. Desperate to harness this great power Dr Doom assembles a team of villains to collect these pieces. Nick Fury unites the greatest heroes the Marvel universe has to offer to put a stop to Doom's nefarious scheme.",
                                language: "English",
                                country: "UK",
                                awards: "4 nominations.",
                                poster: "https://m.media-amazon.com/images/M/MV5BOTA5ODA2NTI2M15BMl5BanBnXkFtZTgwNTcxMzU1MDE@._V1_SX300.jpg",
                                ratings: [
                                    .init(source: "Internet Movie Database",
                                          value: "8.2/10")
                                ],
                                metascore: "N/A",
                                imdbRating: "8.2",
                                imdbVotes: "2,307",
                                imdbId: "tt2620204",
                                type: .game,
                                dvd: "N/A",
                                boxOffice: "N/A",
                                production: "N/A",
                                website: "N/A",
                                response: "True")
        return NavigationView {
            DetailsView(viewModel: viewModel)
        }
    }
}
