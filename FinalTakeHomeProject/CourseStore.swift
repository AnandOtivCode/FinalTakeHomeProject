//
//  CourseStore.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-16.
//



import Foundation

class CourseStore: ObservableObject {
    
    //static var exampleCourseStore: CourseStore = CourseStore(favouriteCourses: [CourseData.sampleCourseData])
    
    @Published var favouriteCourses: [Course]
    @Published var semesters: [Semester] = []
    
    
    init(favouriteCourses: [Course]) {
        self.favouriteCourses = favouriteCourses
    }
    
    var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
    
    
    func isInCollection(course: Course )-> Bool{
        favouriteCourses.contains(course)
    }
    
    func saveFavourites(){
        let savedLocation = documentDirectory.appendingPathComponent("favourites.json")
        
        do{
            let jsonencoder = JSONEncoder()
            let savedData = try jsonencoder.encode(favouriteCourses)
            
            try savedData.write(to: savedLocation)
            
        } catch{
            print("Error trying to save - \(error.localizedDescription)")
        }
    }
    
    func addToFavourites(course: Course){
        if !isInCollection(course: course){
            favouriteCourses.append(course)
            saveFavourites()
        }
    }
    
    
    func removeFromFavourites(usingIndexSet indexSet: IndexSet){
        favouriteCourses.remove(atOffsets: indexSet)
        saveFavourites()
    }
    
    func removeFromFavourites(course: Course){
        guard let index = favouriteCourses.firstIndex(of: course) else { return }
        favouriteCourses.remove(at: index)
        saveFavourites()
    }
    
    
    func retrieveFavourites(){
        let savedLocation = documentDirectory.appendingPathComponent("favourites.json")
        do{
            let jsondecoder = JSONDecoder()
            let fetchedData = try Data(contentsOf: savedLocation)
            favouriteCourses = try jsondecoder.decode([Course].self, from: fetchedData)
            
        }catch{
            print("Error trying to decode - \(error.localizedDescription)")
        }
    }


    
    
    
}
