//
//  CollegeDetailView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//




import SwiftUI

struct CollegeDetailView: View {
    
    //MARK: - Properties
    var collegeData: CollegeData
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    Text("Hello")
                    Text(collegeData.name)
                    Text(collegeData.subtitle)
                    Text(collegeData.details)
                    LazyVGrid(columns: gridColumns){
                        ForEach(collegeData.allImages, id:\.self){
                            collegeImage in
                            AsyncImage(url: URL(string:collegeImage)){
                                result in
                                if let image = result.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                       // .frame(width: 200, height: 100)
                                        .clipShape(.rect(cornerRadius: 15))
                                } else if result.error != nil{
                                    Image(systemName: "photo")
                                } else {
                                    ProgressView()
                                }
                            }
                            
                            
                        }
                    }
                    
                    
                    
                }
                
                
            }
            
            //
            
        }
        //                    AsyncImage(url: URL(string: collegeData.schoolimages))
        
        
        
        
        
        .padding()
        
        
    }
}
            
        
    
    
    
//
//ForEach(collegeData.allImages, id: \.self) { urlString in
//                        AsyncImage(url: URL(string: urlString)) { image in
//                            image
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 200)
//                                .cornerRadius(10)
//                                .shadow(radius: 4)
//                        } placeholder: {
//                            ProgressView()
//                        }
//                    }

#Preview {
    CollegeDetailView(collegeData: CollegeData.sampleCollegeData)
}


//DetailView(movie: Movie.exampleMovie)
