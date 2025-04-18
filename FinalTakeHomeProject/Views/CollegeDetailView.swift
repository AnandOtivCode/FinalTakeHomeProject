//
//  CollegeDetailView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//


//View for showing all the results from the College Information JSON

import SwiftUI

struct CollegeDetailView: View {
    
    //MARK: - Properties
    var collegeData: CollegeData
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    //Animation Properties
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var enabled = false

    var longPressGuesture: some Gesture{
        LongPressGesture(minimumDuration: 0.2)
    
            .onEnded { _ in
                withAnimation {
                    rotationAngle += .degrees(360)
                    enabled.toggle()
                        
                }
            }
    }
    //MARK: - Body Property
    var body: some View {
        NavigationStack{
                VStack{
                    //College Logo Image
                    AsyncImage(url: URL(string:collegeData.logo)){
                        result in
                        HStack{
                            if let image = result.image{
                                image
                                    .resizable()
                                    .frame(width: 80, height:80)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(rotationAngle)
                                    .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
                                    .gesture(longPressGuesture)

                                    
                                        /*When a user long presses on the image, it causes it to rotate, 360 degrees with a little
                                         springiness.*/
                                        
                                   
                                
                            } else if result.error != nil{
                                Image(systemName: "photo")
                            } else {
                                ProgressView()
                            }
                            
                            //College Title Name
                            Text(collegeData.name)
                                .font(Font.custom("SpaceGrotesk-Bold", size: 50))
                        }
                    }
                    //College Subtitle
                    Text(collegeData.subtitle).font(Font.custom("SpaceGrotesk-Regular", size: 20)).padding(.bottom, 9.0)
                    Divider()
                    //College Details
                    Text(collegeData.details)
                        .font(.headline)
                        .fontWeight(.thin)
                    //Displays All images in a Grid
                    LazyVGrid(columns: gridColumns){
                        //Load each image in the Array
                        ForEach(collegeData.allImages, id:\.self){
                            collegeImage in
                            AsyncImage(url: URL(string:collegeImage)){
                                result in
                                if let image = result.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(.rect(cornerRadius: 15))
                                } else if result.error != nil{
                                    Image(systemName: "photo")
                                } else {
                                    //Show progress view while image is loading
                                    ProgressView()
                                }
                            }
                            
                            
                        }
                    }
                    //Link To St Clair Website
                    Spacer()
                    NavigationLink(destination: WebView(webText: "https://www.stclaircollege.ca")){
                        Label("Visit St Clair Website", systemImage: "tent")
                    }
                    
                    
                    
                }
                
                

            
        }
      
        
        
        
        
        
        .padding()
        
        
    }
}
            
 

#Preview {
    CollegeDetailView(collegeData: CollegeData.sampleCollegeData)
}


