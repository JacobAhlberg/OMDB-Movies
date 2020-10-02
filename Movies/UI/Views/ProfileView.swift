//
//  ProfileView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-10-02.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
