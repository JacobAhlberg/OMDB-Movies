//
//  MovieCell.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-29.
//

import SwiftUI

struct MovieCell: View {
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

struct MovieCellPreviews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: .init(title: "Blade", year: "1995", imdbId: "fguyahifiud", type: .movie, poster: "https://m.media-amazon.com/images/M/MV5BOWVjZTIzNDYtNTBlNC00NTJjLTkzOTEtOTE0MjlhYzI2YTcyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"))
    }
}
