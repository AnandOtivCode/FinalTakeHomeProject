struct CourseDatas: Codable {
    var fetchedResults: [CourseData]
}


struct CourseData: Codable, Hashable, Identifiable{
   static let sampleCourseData = CourseData(
    
        semesterNum: "1",
        semesterHrs: "22",
        semesterCourses: [
            Course(
                code: "WEB110",
                name: "HTML & CSS",
                description: """
                This course is designed to provide students with an introduction to the techniques that are used to create content for the web. Students will develop a good understanding of HTML with an introduction to CSS. Topics include: Web design considerations, working with text, images, links, navigation, using tables for tabular data, the use of multimedia in web pages, and CSS to control presentation.
                """,
                credits: "4",
                inPrograms: ["B990", "T850", "T860", "T861"]
            )
        ]
    )

    
    
    var id: Int { semesterNum.hashValue}

    var semesterNum: String
    var semesterHrs: String
    var semesterCourses: [Course]
}
