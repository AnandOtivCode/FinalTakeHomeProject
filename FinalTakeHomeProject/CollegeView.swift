//
//  CollegeView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//


import SwiftUI

struct CollegeView: View {
    
    //MARK:- Properties
    @State  var college: CollegeData?=nil
    
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                
                VStack {
                    //for unwrapping the data
                    if let college = college {
                        CollegeDetailView(collegeData: college)
                    }
                }.onAppear(){
                    loadData()
                }
                
                
                
                
                
            }
            .padding()
        }
    }
    
    
    
    
    
    
    
    
    
    func loadData(){
        Task{
            let urlString = "https://dtakaki.scweb.ca/MAD432/Finalproject/collgeInfo1.json"
            
            guard let url = URL(string: urlString) else { return }
            
            
            do{
                let (data,_) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(CollegeData.self, from: data)
                
                college = results
                
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
