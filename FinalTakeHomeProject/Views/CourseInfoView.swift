//
//  CourseInfoView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//




import SwiftUI

struct CourseInfoView: View {
    // @ObservedObject var coursestore: CourseStore
    
    
    //MARK:- Properties
    @State private var courseData: [CourseData] = []
    @State private var semesters: [Semester] = []
    
    
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: gridColumns){
               // Text("hI ouTSIDE")
                ForEach(semesters){
                    semester in
                    VStack{
                        //Text("Hi INside")
                        Text(semester.semesterNum)
                        Text("\(semester.semesterHrs) hrs")

                        
                        
                    }
                }
                
            }.onAppear(){
                loadData()
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
    
    
    
    
    
    #Preview {
       // CourseInfoView()
    }
    
    
    
    
    
    
    
    
    //            ScrollView {
    //
    //
    //                LazyVGrid(columns: gridColumns){
    //                    ForEach(courseData){
    //                        course in
    //                        //Link to the detail view
    //                        NavigationLink(destination: SemesterDetailView(coursestore:coursestore,courseData:course)){
    //                            Text("Semester \(course.semesterNum)")
    //                                                        .font(.headline)
    //                        }
    //
    //
    //
    //
    //
    //                    }
    //                    .padding()
    //                }
    //            }.onAppear(){
    //                loadData()
    //        }
    //
    //
    //
    //        }
}
