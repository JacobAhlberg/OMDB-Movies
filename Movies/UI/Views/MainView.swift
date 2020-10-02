//
//  MainView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-10-02.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            SearchView(viewModel: SearchViewModel())
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                }

            ProfileView(viewModel: ProfileViewModel())
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
