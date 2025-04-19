

import SwiftUI


struct SemesterDetailView: View {
    
    //MARK: - Properties
    @ObservedObject var coursestore: CourseStore
    @State  var semester:Semester
    
    
    //MARK: - Body Property
    var body: some View {
        //Title Semester(Num)
        Text("Semester \(semester.semesterNum)")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(Color.red)
        //Show all the courses in the semester
        List(semester.semesterCourses) { course in
            NavigationLink(destination: CourseDetailView(coursestore:coursestore,course:course)){
                HStack{
                    //Desk Image beside each course
                    Image(systemName: "studentdesk").resizable().padding(.trailing, 15.0).frame(width: 30, height: 30)
                    VStack() {
                        Spacer()
                        //Course Name
                        Text(course.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        //Course Code
                        Text(course.code)
                            .font(.subheadline)
                            .bold()
                            .multilineTextAlignment(.leading)
                        Spacer()
                        
                    }
                }

            }
            
        }
        
        
        
        
        
    }
}





