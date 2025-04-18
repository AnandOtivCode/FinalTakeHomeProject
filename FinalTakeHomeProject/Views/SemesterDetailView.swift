

import SwiftUI


struct SemesterDetailView: View {
    
    //MARK:- Properties
    @ObservedObject var coursestore: CourseStore
    @State  var semester:Semester
    
    
    //MARK: - Body Property
    var body: some View {
        Text("Semester \(semester.semesterNum)")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(Color.red)
        List(semester.semesterCourses) { course in
            NavigationLink(destination: CourseDetailView(coursestore:coursestore,course:course)){
                HStack{
                    Image(systemName: "studentdesk").resizable().padding(.trailing, 15.0).frame(width: 30, height: 30)
                    VStack() {
                        Spacer()
                        Text(course.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        Text(course.code)
                            .font(.subheadline)
                            .bold()
                            .multilineTextAlignment(.leading)
                        Spacer()
                        
                    }
                }

                //.padding(.vertical, 4)
            }
            
        }
        
        
        
        
        
    }
}


#Preview {
    CourseInfoView()
}



