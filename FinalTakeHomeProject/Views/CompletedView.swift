//
//  CompletedView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-17.
//

import SwiftUI

struct CompletedView: View {
    @ObservedObject var coursestore: CourseStore

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationStack{
            List{
                ForEach(coursestore.favouriteCourses, id:\.id){
                    course in
                    VStack{
                        Text(course.name)
                        Text(course.code)
                        
                    }
                }.onDelete(perform: { indexSet in
                    coursestore.removeFromFavourites(usingIndexSet: indexSet)
                })
            }
        }

    }
}

#Preview {
    //CompletedView()
}
