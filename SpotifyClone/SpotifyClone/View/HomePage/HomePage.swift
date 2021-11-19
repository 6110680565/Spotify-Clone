//
//  HomeP.swift
//  SpotifyClone
//
//  Created by AlkanBurak on 18.11.2020.
//

import SwiftUI

struct HomePage:View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
      }

    var body: some View {
        NavigationView{
            TabView{
                ContentPage()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                SearchPage()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                LibraryPage(CategoryIndex: 0)
                    .tabItem {
                        Image("library")
                        Text("Library")
                    }
            }
            .navigationBarItems(trailing: logOutButton)
            .accentColor(.white)
        }
    }
    
    var logOutButton: some View{
        Button{
            AuthViewModel.share.signOut()
        } label:{
            Text("Log Out")
                .foregroundColor(.white)
        }
    }
}


struct HomeP_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}