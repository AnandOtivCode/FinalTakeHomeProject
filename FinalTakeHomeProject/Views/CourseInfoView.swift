//
//  CourseInfoView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//




import SwiftUI

struct CourseInfoView: View {
    //@ObservedObject var coursestore: CourseStore
    @StateObject private var coursestore = CourseStore(favouriteCourses: [])
    
    @State private var pickedColor =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    
    //MARK:- Properties
    @State private var courseData: [CourseData] = []
    @State private var semesters: [Semester] = []
    
    
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                
                Text("Course Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                ColorPicker("", selection: $pickedColor).padding()
                
                
                
                LazyVGrid(columns: gridColumns){
                    // Text("hI ouTSIDE")
                    ForEach(semesters){
                        semester in
                        NavigationLink(destination: SemesterDetailView(coursestore: coursestore,semester:semester)){
                            ZStack{
                                //Shows the picked Color
                                pickedColor
                                
                                
                                VStack{
                                    Image(systemName: "\(semester.semesterNum).square.fill").resizable().frame(width: 30, height: 30)
                                    Text("Semester: \(semester.semesterNum)")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                    Text("Course Hours: \(semester.semesterHrs) hrs")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    
                                }
                                .padding(.vertical, 5.0)
                            }.clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        
                    }
                    
                }.onAppear(){
                    loadData()
                }
                
            }
            
        }
    }
    
    
    
    
    //MARK: - fetch method
    func loadData(){
        Task{
            let urlString = "https://dtakaki.scweb.ca/MAD432/Finalproject/programDetails.json"
            
            guard let url = URL(string: urlString) else { return }
            
            
            do{
                let (data,_) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(CourseData.self, from: data)
                
                semesters = results.fetchedResults
            }
            
            catch DecodingError.valueNotFound(let error, let message){
                print( "Value is missing: \(error) - \(message.debugDescription)")
            } catch DecodingError.typeMismatch(let error, let message){
                print( "Types do not match: \(error)- \(message.debugDescription)")
            } catch DecodingError.keyNotFound(let error, let message){
                print( "Incorrect property name: \(error)- \(message.debugDescription)")
            } catch {
                print( "Unknown error has occurred- \(error.localizedDescription)")
            }
            
            
            
        }
        
        
    }
}
    
    
    
    
    
    #Preview {
        CourseInfoView()
    }
    
    
    
    
    
    
    


