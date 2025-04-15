//
//  CollegeView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//


import SwiftUI

struct CollegeView: View {
    
    //MARK:- Properties
    @State private var college: [CollegeData] = []
    
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                
                VStack {
                    CollegeDetailView(collegeData: CollegeData.sampleCollegeData)
                   

                }
                .padding()
            }
        }
    }
    
    
    
    
    
    
    
    
    func loadData(){
        Task{
            let urlString = "https://dtakaki.scweb.ca/MAD432/Finalproject/collgeInfo1.json"
            
            guard let url = URL(string: urlString) else { return }
            
            
            do{
                let (data,_) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(CollegeDatas.self, from: data)
                
                college = results.data
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
    CollegeView()
}
