//
//  ContentView.swift
//  Course List
//
//  Created by Lam Nguyen on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear(perform: {
                getCourses()
            })
    }
    
    func getCourses() {
        let apiString =  "https://zappycode.com/api/courses?format=json"
        
        if let apiURL = URL(string: apiString) {
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    let apiDataString = String(data: data!, encoding: .utf8)
                    print(apiDataString ?? "Error")
                }
                
                
            }.resume()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
