//
//  FinalTakeHomeProjectApp.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//

import SwiftUI

@main
struct FinalTakeHomeProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                Tab("The College", systemImage: "magnifyingglass"){
                    CollegeView()
                }
            }
        }
    }
}



//import SwiftUI
//
//@main
//struct CampSearchApp: App {
//    @StateObject private var campstore = Campstore(favouriteCampsites: [])
//    
//    var body: some Scene {
//        WindowGroup {
//            TabView{
//                Tab("Camp Search", systemImage: "magnifyingglass"){
//                    ContentView(campstore: campstore)
//                }
//                Tab("Favourite Campsites", systemImage: "tent"){
//                    FavouriteCampsitesView(campstore: campstore)
//                }.badge(campstore.favouriteCampsites.count)
//                
//            }.onAppear(){
//                campstore.retrieveFavourites()
//            }
//        }
//    }
//}
