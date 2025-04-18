//
//  CompletedView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-17.
//

import SwiftUI

struct CompletedView: View {
    @ObservedObject var coursestore: CourseStore
  // @StateObject private var coursestore = CourseStore(favouriteCourses: [])


    var body: some View {
        Text("Completed Courses")
            .font(.title)
            .fontWeight(.medium)
        NavigationStack{
            List{
                ForEach(coursestore.favouriteCourses, id:\.id){
                    course in
                    HStack{
                        Image(systemName: "checkmark.arrow.trianglehead.counterclockwise").resizable().padding(.trailing, 15.0).frame(width: 40, height: 40)
                        VStack{
                            Text(course.code)
                                .font(.headline)
                                .foregroundColor(Color.red)
                            Text(course.name)
                                .font(.body)
                                .fontWeight(.medium)
                            
                        }
                    }
                }.onDelete(perform: { indexSet in
                    coursestore.removeFromFavourites(usingIndexSet: indexSet)
                })
            }
        }

    }
}

#Preview {
    EntryView()
}
