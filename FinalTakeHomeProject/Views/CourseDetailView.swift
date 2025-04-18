//
//  CourseDetailView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-17.
//



import SwiftUI


struct CourseDetailView: View {
    
    //MARK:- Properties
    @ObservedObject var coursestore: CourseStore
    @State  var course:Course
    //MARK: - State properties
    @State private var isAlertShowing = false
    
    
    //MARK: - Body Property
    var body: some View {
        ScrollView{
            
            Text(course.name)
            Text(course.code)
            Text(course.description ?? "No Description")
            
            
            let programs = course.inPrograms ?? []
            ForEach(programs , id: \.self) { program in
                Text(program)
            }}.toolbar{
                ToolbarItem{
                    if !coursestore.isInCollection(course: course){
                            Button("Add", systemImage: "heart"){
                                isAlertShowing.toggle()
                            }
                        }else{
                            Button("Add", systemImage: "heart.fill"){
                                isAlertShowing.toggle()
                            }
                        }
                        
                        
                    }
                }     .alert("Change Confirmation", isPresented: $isAlertShowing) {
                    if !coursestore.isInCollection(course: course){
                        Button("Add"){
                            //TODO: - Add to favourites and save changes
                            coursestore.addToFavourites(course: course)
                        }
                    }
                    if coursestore.isInCollection(course: course){
                        Button("Remove", role: .destructive){
                            coursestore.removeFromFavourites(course: course)
                        }
                    }
                    Button("Cancel", role: .cancel){
                        
                    }
                }message: {
                    Text("Do you want to make these changes for \(course.name)?")
                }
            }
            
            //course.inPrograms ?? []) { program in
            //Text(program ?? "")
            
            
            
            
            
            
            
            
            
        
    }
    

