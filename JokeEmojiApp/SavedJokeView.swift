//
//  SavedJokeView.swift
//  JokeEmojiApp
//
//  Created by Chun Choi on 2020-12-07.
//

import SwiftUI

struct SavedJokeView: View {
    @State private var allJokes:savedJokes = savedJokes(jokes: [Joke]())
    
    var body: some View {
        VStack{
            Form{
                ForEach(0..<allJokes.jokes.count, id: \.self){ num in
                    Section(header: Text("Saved Jokes")) {
                        Text(allJokes.jokes[num].setup)
                        Text(allJokes.jokes[num].punchline)
                    }
                }
            }
            .navigationBarTitle("All Saved Jokes")
        }.onAppear(perform: loadJoke)
    }
    
    func loadJoke(){
        // Loading the joke from user Defaults

        let defaults = UserDefaults.standard // Important

        if let savedJoke = defaults.object(forKey: "SavedJokes") as? Data {
            let decoder = JSONDecoder()
            if let jokes = try? decoder.decode(savedJokes.self, from: savedJoke) {
                allJokes = jokes
                print(allJokes)
            }
        }
    }
}

struct SavedJokeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedJokeView()
    }
}
