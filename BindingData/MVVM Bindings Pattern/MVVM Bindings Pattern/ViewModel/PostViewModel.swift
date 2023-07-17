//
//  PostViewModel.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/06/14.
//

import Foundation

class PostViewModel {
    
    var postData : ObservableObjects<[UserPostTableModel]> = ObservableObjects([])
    
    func getPostData() {
        
        // Create the URL for the API endpoint
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
            
        }
        // Perform a data task to fetch the data from the URL
        let dataTask = URLSession.shared.dataTask(with: url) {(data, response ,error) in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // Handle the error case
                print(error?.localizedDescription ?? "Data request failed")
                return
            }
            do {
                // Decode the retrieved data into an array of PostModel objects
                let postModels = try JSONDecoder().decode([PostModel].self, from: data)
                
                // Convert the PostModel objects into an array of UserPostTableModel objects
                self.postData.value =  postModels.compactMap({ UserPostTableModel(title: $0.title, body: $0.body) })
                
            }catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
