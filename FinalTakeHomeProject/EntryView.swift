//
//  EntryView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//




import SwiftUI

struct EntryView: View {
   
        var body: some View {
            
            //Add tabs to switch between different views
            TabView{
                Tab("The College", systemImage: "graduationcap.fill"){
                    CollegeView()
                }
                Tab("Projects", systemImage: "hammer"){
                   ProjectView()
               }
            }
        }
    }


#Preview {
    EntryView()
}
