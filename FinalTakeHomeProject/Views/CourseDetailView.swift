//
//  CourseDetailView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-17.
//



import SwiftUI


struct CourseDetailView: View {
    
    //MARK: - Properties
    @ObservedObject var coursestore: CourseStore
    //@State was here earlier
    var course:Course
    //MARK: - State properties
    @State private var isAlertShowing = false
    
    
    //MARK: - Body Property
    var body: some View {
        ScrollView{
            //Course Name
            Text(course.name).font(Font.custom("FreckleFace-Regular", size: 50)).foregroundColor(Color.purple)
            Divider()
            //Course Code
            Text(course.code)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
            Spacer()
            //Course Description
            Text(course.description ?? "No Description")
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
                
            
            Text("Course Found In")
                .fontWeight(.semibold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.842, brightness: 0.68))
                .multilineTextAlignment(.center)
            //Lists where all the courses are found in
            let programs = course.inPrograms ?? []
            ForEach(programs , id: \.self) { program in
                Text(program)
            }}.padding()
            
            
            //Adds a heart button to the courses so u can add to completed courses
            .toolbar{
            
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
            
          
            
            
            
            
            
            
        
    }

#Preview {
    CourseInfoView()
}

    

