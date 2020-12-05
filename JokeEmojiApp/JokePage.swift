//
//  JokePage.swift
//  JokeEmojiApp
//
//  Created by Chun Choi on 2020-12-05.
//

import SwiftUI

struct JokePage: View {
    @State private var joke:Joke = Joke(id: 1, type: "", setup:"", punchline: "")
    @State private var punchLine = ""
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Setup")){ // Another Joke
                    Text("\(joke.setup)")
                }
                
                Section(header: Text("Punchline")){ // Punchline
                    Text("\(punchLine)")
                    Button("Show Punchline"){ // Show Punchline
                        self.punchLine = joke.punchline
                    }
                }
                
                Section(header: Text("Utility")){ // Button and stuff
                    Button("Get Another Joke"){ // Getting another Joke
                        getJoke() // getting another joke
                        self.punchLine = ""
                    }
                    NavigationLink(destination: Text("Random Emoji")){
                        Text("Random Emoji")
                    }
                }
            }
            .navigationBarTitle("Jokes For You")
        }.onAppear(perform: {
            getJoke() // Getting joke when it's loaded
        })
    }
    
    func getJoke(){
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                if let jokes = try? JSONDecoder().decode(Joke.self, from: data){
                    
                    self.joke = jokes
                }
            }
        }.resume()
        
    }
    
}

struct JokePage_Previews: PreviewProvider {
    static var previews: some View {
        JokePage()
    }
}
