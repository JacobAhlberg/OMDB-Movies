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
                            Spacer(minLength: geometry.size.height * 0.2)
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
        .alert(item: self.$viewModel.error, content: { error in
            Alert(title: Text("Error has occured"),
                  message: Text(error.localizedDescription),
                  dismissButton: .cancel())
        })
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

                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.genre)
                        .font(.system(size: 14,
                                      weight: .semibold,
                                      design: .default))
                    HStack(alignment: .bottom, spacing: 10) {
                        Text(movie.runtime)
                            .font(.system(size: 14,
                                          weight: .semibold,
                                          design: .default))
                            .foregroundColor(Color(.systemGray))
                        Rectangle()
                            .frame(width: 1, height: 15)


                        RatingView(rating: movie.imdbRating)
                    }
                }

            }
            .foregroundColor(Color(.label))
            .padding(.top, 20)
            Spacer()
        }
    }
}

struct RatingView: View {
    let rating: String

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(.systemYellow))
                .frame(height: 14)
            Text("\(rating)/10")
                .font(.system(size: 14,
                              weight: .medium,
                              design: .default))
        }
    }
}

struct DetailsView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DetailsView(viewModel: MovieDetailViewModel.viewModel)
            }
            NavigationView {
                DetailsView(viewModel: MovieDetailViewModel.viewModel)
            }.colorScheme(.dark)
        }
    }
}
