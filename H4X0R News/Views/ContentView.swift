//
//  ContentView.swift
//  H4X0R News
//
//  Created by JamesChen on 2022/11/14.
//

import SwiftUI

struct ContentView: View {
    
    //對應實作ObservableObject的class廣播，進行接收與監聽
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts, rowContent: { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            })
            .navigationTitle("H4X0R News")
        }
        //初始化fetchPostData()的Json Data
        .onAppear {
            self.networkManager.fetchPostData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "World")
//]
