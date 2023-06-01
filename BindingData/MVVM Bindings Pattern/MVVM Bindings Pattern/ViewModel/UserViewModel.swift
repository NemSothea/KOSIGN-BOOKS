//
//  UserViewModel.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/05/31.
//

import Foundation
struct UserViewModel {
    
    var users : ObservableObjects<[UserTableModel]> = ObservableObjects([])
    
    func fetchData () {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return}
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do {
                let userModels = try JSONDecoder().decode([Users].self, from: data)
                self.users.value = userModels.compactMap({
                    UserTableModel(name: $0.name ?? "")
                })
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
                
    }
}
