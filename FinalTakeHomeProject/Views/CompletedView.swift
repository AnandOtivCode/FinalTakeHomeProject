//
//  CompletedView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-17.
//

//View for showing list of completed courses

import SwiftUI

struct CompletedView: View {
    
    
    //MARK: - Properties
    @ObservedObject var coursestore: CourseStore
    
    
    //MARK: - Body Property
    var body: some View {
        //Title
        Text("Completed Courses")
            .font(.title)
            .fontWeight(.medium)
        NavigationStack{
            List{
                //Goes through favourite courses list and display them on by one
                ForEach(coursestore.favouriteCourses, id:\.id){
                    course in
                    HStack{
                        Image(systemName: "checkmark.arrow.trianglehead.counterclockwise").resizable().padding(.trailing, 15.0).frame(width: 40, height: 40)
                        VStack{
                            //Course Code
                            Text(course.code)
                                .font(.headline)
                                .foregroundColor(Color.red)
                            //Course Name
                            Text(course.name)
                                .font(.body)
                                .fontWeight(.medium)
                            
                        }
                    }
                    //Deletes from list
                }.onDelete(perform: { indexSet in
                    coursestore.removeFromFavourites(usingIndexSet: indexSet)
                })
            }
        }

    }
}

#Preview {
    ContentView()
}
