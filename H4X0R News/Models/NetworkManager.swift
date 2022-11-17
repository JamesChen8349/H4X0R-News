//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by JamesChen on 2022/11/15.
//

import Foundation

//ObservableObject定義可讓SwiftUI監聽
class NetworkManager: ObservableObject {
    
    //Published定義此代碼表示此變數可發佈給任一SwiftUI監聽更新狀態
    @Published var posts = [Post]()
    
    func fetchPostData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responses, error) in
                if error == nil {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do{
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async { //讓主線等待更新狀況避免Console Error
                                self.posts = result.hits
                            }
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
