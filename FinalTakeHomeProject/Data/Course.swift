//
//  Course.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-14.
//


import Foundation

struct Course: Codable,Hashable{
    
    var code: String
    var name: String
    var description: String
    var credits:String
    var inPrograms: [String]
}








/*
 {
                  "code": "MAD102",
                  "name": "Introduction to Programming",
                  "description": "The course is an introduction to general computer concepts and an introduction to the programming process. Students will learn and employ fundamental concepts related to developing basic programming logic., Students will develop small programs that utilize basic control structures, data structures and functions. Students will be introduced to the object-oriented programming process using a modern programming language.",
                  "credits": "4",
                  "inPrograms": [
                      "B990",
                      "T850"
                  ]
              }
 */
