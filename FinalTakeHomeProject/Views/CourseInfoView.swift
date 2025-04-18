//
//  CourseInfoView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//




import SwiftUI

struct CourseInfoView: View {
    //MARK: - Properties
    
    @ObservedObject private var coursestore = CourseStore(favouriteCourses: [])
    
    //Color for color picker
    @State private var pickedColor =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    
    @State private var courseData: [CourseData] = []
    @State private var semesters: [Semester] = []
    
    //Grid Layout
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    //MARK: - Body Property
    var body: some View {
        
        NavigationStack {
            ScrollView{
                //Title
                Text("Course Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                //Color Picker
                ColorPicker("", selection: $pickedColor).padding()
                
                
                //Displays All Semesters in a Grid
                LazyVGrid(columns: gridColumns){
                    // Text("hI ouTSIDE")
                    ForEach(semesters){
                        semester in
                        NavigationLink(destination: SemesterDetailView(coursestore: coursestore,semester:semester)){
                            ZStack{
                                //Shows the picked Color
                                pickedColor
                                
                                
                                VStack{
                                    //Image showing the semester Number
                                    Image(systemName: "\(semester.semesterNum).square.fill").resizable().frame(width: 30, height: 30)
                                    //Text Showing the semester Number
                                    Text("Semester: \(semester.semesterNum)")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                    //Course Hours
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
    
    
    
    
    
    
    


