//
//  EntryView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//




import SwiftUI

struct EntryView: View {
    //@ObservedObject var coursestore: CourseStore
    @StateObject private var coursestore = CourseStore(favouriteCourses: [])
    
    
    
    
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
                CompletedView(coursestore:coursestore)
            }.badge(coursestore.favouriteCourses.count)
            Tab("Projects", systemImage: "hammer"){
                ProjectView()
            }
            
       
        }.onAppear(){
            coursestore.retrieveFavourites()
        }
    }
}


#Preview {
    EntryView()
}
