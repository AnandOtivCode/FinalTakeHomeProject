

import SwiftUI


struct SemesterDetailView: View {
    
    //MARK:- Properties
    @ObservedObject var coursestore: CourseStore
    @State  var semester:Semester
    
    
    //MARK: - Body Property
    var body: some View {
        Text("hi")
        List(semester.semesterCourses) { course in
            NavigationLink(destination: CourseDetailView(coursestore:coursestore,course:course)){
                VStack() {
                    Text(course.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(course.code)
                        .font(.subheadline)
                        .bold()
                }
                .padding(.vertical, 4)
            }
            
        }
        
        
        
        
        
    }
}


