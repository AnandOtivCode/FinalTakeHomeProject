//
//  SemesterDetailView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-16.
//






import SwiftUI

struct SemesterDetailView: View {
    @ObservedObject var coursestore: CourseStore

    
    //MARK: - Properties
    var courseData: CourseData
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                Text("Semester Detail View")
//                ZStack{
//                    Color(.orange)
//
//                    VStack{
//                        
//                        
//                        Text("Semester \(courseData.semesterNum)")
//                        Text(courseData.semesterHours)
//                        
//                    }
//                }
                
                
            }
            
            //
            
        }
        .padding()
        
        
    }
}
            
        
    
    
    
//
//ForEach(collegeData.allImages, id: \.self) { urlString in
//                        AsyncImage(url: URL(string: urlString)) { image in
//                            image
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 200)
//                                .cornerRadius(10)
//                                .shadow(radius: 4)
//                        } placeholder: {
//                            ProgressView()
//                        }
//                    }

#Preview {
    //CollegeDetailView(collegeData: CollegeData.sampleCollegeData)
    
   // SemesterDetailView(tvstore: TVStore.exampleTVShowStore, tvShow: TVShow.exampleTVShow)
    
    SemesterDetailView(coursestore:CourseStore.exampleCourseStore, courseData: CourseData.sampleCourseData)
}


//DetailView(movie: Movie.exampleMovie)

