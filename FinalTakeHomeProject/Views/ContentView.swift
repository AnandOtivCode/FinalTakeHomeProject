//
//  ContentView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//




import SwiftUI

struct ContentView: View {
    //@ObservedObject var coursestore: CourseStore
    
    
    //MARK: - Properties
    @StateObject private var coursestore = CourseStore(favouriteCourses: [])

    
    
    //MARK: - Body Property

    var body: some View {
        
        //Add tabs to switch between different views
        TabView{
            Tab("The College", systemImage: "graduationcap.fill"){
                CollegeView()
            }
            Tab("Course Info", systemImage:"info.circle"){
                CourseInfoView()
            }
            Tab("Completed", systemImage: "checkmark.circle"){
                CompletedView(coursestore: coursestore)}.badge(coursestore.favouriteCourses.count)
            
            Tab("Projects", systemImage: "hammer"){
                ProjectView()
            }
            
         
            
       //Retrieves Favourite List for Completed Tab
        }.onAppear(){
            coursestore.retrieveFavourites()
        }
    }
}


#Preview {
    ContentView()
}

