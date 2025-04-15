//
//  CollegeData.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//



import Foundation

struct CollegeDatas:Codable{
    var data: [CollegeData] = []
}

struct CollegeData: Codable,Hashable{
    
    static let sampleCollegeData = CollegeData(
        name: "St. Clair College",
        logo: "https://dtakaki.scweb.ca/Data/images/Stacked%20Logo%20CMYK.png",
        schoolimages: [
            "https://dtakaki.scweb.ca/Data/images/windsor-campus-pond-night.jpg",
            "https://dtakaki.scweb.ca/Data/images/windsor-campus-student-area.jpg",
            "https://dtakaki.scweb.ca/Data/images/windsor-campus-drone.jpg",
            "https://dtakaki.scweb.ca/Data/images/will_not_load.jpg",
            "https://dtakaki.scweb.ca/Data/images/windsor-campus-pond-night-holiday.jpg"
            
        ],
        subtitle: "Rise Above the Ordinary",
        programUrl: "https://www.stclaircollege.ca/future-students",
        details: "St. Clair College's coat-of-arms bears the mighty Griffin, and like the mythical creature with eagleâ€™s wings, St. Clair College is a place where students take flight to rise above the ordinary. It's where you will learn new things, expand your mind, create lasting friendships, experience college life, and most importantly, get the skills and knowledge you need to get the job."
    )
    
    
    
    
    
    var name: String
    var logo: String
    var schoolimages: Set<String>
    var subtitle: String
    var programUrl: String
    var details: String
 
    
}

struct CollegeImage: Codable, Hashable{
    var title: String
    var url: String
}
extension CollegeData{
    var allImages:[String]{
        return Array(schoolimages)
    }
}




