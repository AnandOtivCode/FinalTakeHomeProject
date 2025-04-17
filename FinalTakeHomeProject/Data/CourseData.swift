//Data Classes for Course Data


import Foundation

struct Course: Codable,Hashable, Identifiable{
    var id: Int { code.hashValue }
    var code: String
    var name: String
    var description: String?
    var credits:String
    var inPrograms: [String]
}


struct Semester: Codable, Hashable,Identifiable{
    var id: Int { semesterNum.hashValue}
    var semesterNum: String
    var semesterHrs: Int
    var semesterCourses: [Course]
    
}

struct CourseData: Codable {
    
    let fetchedResults: [Semester]
}

struct CourseDatas:Codable{
    var data: [Semester] = []
}









