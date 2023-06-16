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
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) {(data,_,_) in
            guard let data = data else {return}
            do {
                let postModels = try JSONDecoder().decode([PostModel].self, from: data)
                
                self.postData.value =  postModels.compactMap({ UserPostTableModel(title: $0.title, body: $0.body) })
                
            }catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
