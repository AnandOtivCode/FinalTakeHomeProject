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
            
            Text(course.name).font(Font.custom("FreckleFace-Regular", size: 50)).foregroundColor(Color.purple)
            Divider()
            Text(course.code)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
            Spacer()
                
            Text(course.description ?? "No Description")
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
                
            
            Text("Course Found In")
                .fontWeight(.semibold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.842, brightness: 0.68))
                .multilineTextAlignment(.center)
            let programs = course.inPrograms ?? []
            ForEach(programs , id: \.self) { program in
                Text(program)
            }}.padding().toolbar{
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
            
            
            //.font(Font.custom("SpaceGrotesk-Bold", size: 50))
            
            
            
            
            
            
        
    }

#Preview {
    CourseInfoView()
}

    

