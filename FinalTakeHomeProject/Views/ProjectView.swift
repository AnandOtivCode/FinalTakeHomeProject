//
//  ProjectView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-16.
//

import SwiftUI
/*That project will have an image, a title, the name of the instructor who taught the course
and a short description about what you like about this project. It will be laid out
appropriately. Implement your custom colour on this screen.*/
struct ProjectView: View {
    @State private var selectedProject = "1"
    
    var body: some View {
        
        //Wheel Picker for selecting project
        
        VStack{
            
                Picker("Projects", selection: $selectedProject) {
                    Text("Project 1").fontWeight(.bold).foregroundColor(Color.red).tag("1").font(.title)
                    Text("Project 2").fontWeight(.bold).foregroundColor(Color.orange).tag("2").font(.title)
                    Text("Project 3").fontWeight(.bold).foregroundColor(Color.yellow).tag("3").font(.title)
                    Text("Project 4").fontWeight(.bold).foregroundColor(Color.green).tag("4").font(.title)
                }.pickerStyle(WheelPickerStyle())
                Spacer()
                
                //PROJECT 1: Porfolio Website
            ScrollView{
                if selectedProject == "1" {
                    VStack {
                        Image("Website").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height:350)
                    }
                    Text("Porfolio Website").font(.title).foregroundColor(Color("ProjectColor"))
                    Text("Instructors: Christopher Takaki and")
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    Text("Michael Girimonte")
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    Text("I like being able to make a function portfolio from scratch only using html and css.")
                        .multilineTextAlignment(.center).font(.subheadline)
                    
                    
                    
                    
                }
                //PROJECT 2: TVShow App
                else if selectedProject == "2" {
                    VStack {
                        Image("TVShow App").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height:350)
                        
                        Text("TVShow App").font(.title).foregroundColor(Color("ProjectColor"))
                        Text("Instructor: Christopher Takaki").fontWeight(.heavy).multilineTextAlignment(.center)
                        Text("I found it rewarding to be able to be able to have full access to searching all the shows in the Itunes store on one single app.").multilineTextAlignment(.center).padding(.horizontal, 5.0).font(.subheadline)
                        
                        
                        
                    }
                    
                }
                
                
                //PROJECT 3: Throwing Simulator App
                else if selectedProject == "3" {
                    VStack {
                        
                        Image("ThrowingSimulator").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height:350)
                        ScrollView{
                            Text("Throwing Simulator").font(.title).foregroundColor(Color("ProjectColor"))
                            Text("Instructor: Jonathon Bauer").fontWeight(.heavy).multilineTextAlignment(.center)
                            Text("I am really fond of math and physics and thought it was a lot of fun to implement this in a java app.").multilineTextAlignment(.center).font(.subheadline)
                        }
                        
                    }
                    
                }
                
                
                //PROJECT 3: Throwing Simulator App
                else if selectedProject == "4" {
                    VStack {
                        Image("Vaultify").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height:350)
                        ScrollView{
                            Text("Throwing Simulator").font(.title).foregroundColor(Color("ProjectColor"))
                            Text("Instructor: Cai filiault").fontWeight(.heavy).multilineTextAlignment(.center)
                            Text("I found create a  password manager database app to be rewarding as it was something that could be also useful for other people. ").font(.subheadline).multilineTextAlignment(.center)
                        }
                        
                        
                    }
                    
                }
                
                
                
                
            }
            
        }
    }
}

#Preview {
    ProjectView()
}
