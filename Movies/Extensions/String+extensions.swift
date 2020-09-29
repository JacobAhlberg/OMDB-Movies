//
//  String+extensions.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-29.
//

import Foundation

extension String {
    var convertToData: Data? {
        guard let url = URL(string: self),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        return data
    }
}
