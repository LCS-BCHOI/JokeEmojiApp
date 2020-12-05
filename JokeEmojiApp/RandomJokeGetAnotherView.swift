//
//  RandomJokeGetAnotherView.swift
//  JokeEmojiApp
//
//  Created by Chun Choi on 2020-12-05.
//

import SwiftUI

struct RandomJokeGetAnotherView: View {
    var body: some View {
        VStack{
            Spacer()
            NavigationLink(destination: JokePage()){
                Text("Random Joke")
            }
            
            Spacer()
            
            NavigationLink(destination: JokePage()){
                Text("Get Another")
            }
            Spacer()
        }
    }
}

struct RandomJokeGetAnotherView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeGetAnotherView()
    }
}
