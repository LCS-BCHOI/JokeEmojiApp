//
//  ContentView.swift
//  JokeEmojiApp
//
//  Created by Chun Choi on 2020-12-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                NavigationLink(destination: Text("PlaceHolder")){
                    Text("Random Emoji")
                }
                
                Spacer()
                NavigationLink(destination: RandomJokeGetAnotherView()){
                    Text("Get A Joke")
                }
                Spacer()
                
            }
            .navigationBarTitle("Jokes And Emoji")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
