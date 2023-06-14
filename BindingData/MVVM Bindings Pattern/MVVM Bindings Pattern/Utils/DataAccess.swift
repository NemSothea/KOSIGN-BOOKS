//
//  DataAccess.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/06/08.
//

import Foundation
class DataAccess {
    
    static let shared = DataAccess()
    
    private var user : Users?
    
    private init(){}
    
    func login(email: String, password : String, completion : @escaping(Bool) -> Void) {
        
        DispatchQueue.main.async { [weak self] in
            if email == "test@test.com" && password == "123" {
                self?.user = Users(name: "test", email: "test@test.com")
                completion(true)
            }else {
                self?.user = nil
                completion(false)
            }
        }
       /*
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data,_,_) in
            guard let data = data else {
                return
            }
            
            do {
                let userModels = try JSONDecoder().decode([Users].self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    if email == "test@test.com" && password == "123" {
                        self?.user = Users(name: "test", email: "test@test.com")
                        completion(true)
                    }else {
                        self?.user = nil
                        completion(false)
                    }
                }
                
            }catch {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        */
    }
    
    
    
    
}
