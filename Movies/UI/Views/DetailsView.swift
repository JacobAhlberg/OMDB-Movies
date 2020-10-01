//
//  DetailsView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-29.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    static func create(with movie: MovieSearch) -> DetailsView {
        DetailsView(viewModel: MovieDetailViewModel(movie: movie))
    }

    var body: some View {
        ZStack {
            Unwrap(viewModel.movie) { movie in
                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            Spacer(minLength: geometry.size.height * 0.3)
                            ContentView(movie: movie, image: viewModel.moviePoster)
                                .padding(.bottom, 10)
                        }
                    })
                }
            }

            if viewModel.isLoading {
                ProgressView()
            }
        }
        .onDisappear(perform: {
            self.viewModel.invalidate()
        })
        .background(
            ZStack {
                Unwrap(viewModel.moviePoster) { image in
                    Image(uiImage: image)
                        .resizable()
                        .ignoresSafeArea()
                        .blur(radius: 20)
                }
                BackgroundShape()
                    .foregroundColor(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
            }
        )
    }
}

struct ContentView: View {
    let movie: Movie
    let image: UIImage?

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.systemBackground))
//                .opacity(0.9)
                .cornerRadius(15)
                .padding(.horizontal, 5)
            VStack {
                HeaderView(movie: movie, image: image)
                    .padding(.horizontal, 10)

                VStack(spacing: 30) {
                    SectionView(title: Text("Plot").font(.title2), spacing: 10) {
                        Text(movie.plot)
                            .font(.system(size: 14))
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    VStack(spacing: 15) {
                        SectionView(title: Text("Director")) {
                            Text(movie.director)
                                .font(.system(size: 14))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        SectionView(title: Text("Actors")) {
                            Text(movie.actors)
                                .font(.system(size: 14))
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        SectionView(title: Text("Released")) {
                            Text(movie.released)
                                .font(.system(size: 14))
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        SectionView(title: Text("Language")) {
                            Text(movie.language)
                                .font(.system(size: 14))
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        SectionView(title: Text("Awards")) {
                            Text(movie.awards)
                                .font(.system(size: 14))
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        SectionView(title: Text("Production")) {
                            Text(movie.production)
                                .font(.system(size: 14))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
}



struct HeaderView: View {
    let movie: Movie
    let image: UIImage?

    var body: some View {
        HStack(alignment: .top) {
            Unwrap(image) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 8)
                    .frame(width: 160,
                           height: 160)
                    .offset(y: 160 / -4 )
            }

            VStack(alignment: .leading, spacing: 15) {
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .fixedSize(horizontal: false, vertical: true)
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.genre)
                        .font(.system(size: 14,
                                      weight: .semibold,
                                      design: .default))
                    Text(movie.runtime)
                        .font(.system(size: 14,
                                      weight: .semibold,
                                      design: .default))
                        .foregroundColor(Color(.systemGray))
                }

            }
            .foregroundColor(Color(.label))
            .padding(.top, 20)
            Spacer()
        }
    }
}

struct DetailsView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DetailsView(viewModel: viewModel)
            }
            NavigationView {
                DetailsView(viewModel: viewModel)
            }.colorScheme(.dark)
        }
    }
}

let movie = Movie(title: "Batman: Under the Red Hood",
                  year: "2010",
                  rated: "PG-13",
                  released: "27 Jul 2010",
                  runtime: "75 min",
                  genre: "Animation, Action, Crime, Drama, Sci-Fi, Thriller",
                  director: "Brandon Vietti",
                  writer: "Judd Winick, Bob Kane (Batman created by)",
                  actors: "Bruce Greenwood, Jensen Ackles, John DiMaggio, Neil Patrick Harris",
                  plot: "Batman faces his ultimate challenge as the mysterious Red Hood takes Gotham City by firestorm. One part vigilante, one part criminal kingpin, Red Hood begins cleaning up Gotham with the efficiency of Batman, but without following the same ethical code. Killing is an option. And when the Joker falls in the balance between the two, hard truths are revealed and old wounds are reopened.",
                  language: "English",
                  country: "USA",
                  awards: "1 nominations.",
                  poster: "https://m.media-amazon.com/images/M/MV5BNmY4ZDZjY2UtOWFiYy00MjhjLThmMjctOTQ2NjYxZGRjYmNlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
                  ratings: [
                    .init(source: "Internet Movie Database",
                          value: "8.1/10"),
                    .init(source: "Rotten Tomatoes",
                          value: "100%")
                  ],
                  metascore: "N/A",
                  imdbRating: "8.1",
                  imdbVotes: "53,552",
                  imdbId: "tt1569923",
                  type: .movie,
                  dvd: "N/A",
                  boxOffice: "N/A",
                  production: "DC Entertainment, Warner Bros. Animation",
                  website: "N/A",
                  response: "True")
