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
    @State private var showAlert = false // Show alert when save joke
    @State private var saved = false
    
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
                        saved = false
                    }
                }
                
                Section(header: Text("Utility")){ // Button and stuff
                    Button("Get Another Joke"){ // Getting another Joke
                        getJoke() // getting another joke
                        self.punchLine = ""
                    }
                    Button("Save Joke"){
                        saveJoke()
                    }.disabled(saved)
                    
                    
                }
            }
            .navigationBarTitle("Jokes For You")
            .navigationBarItems(trailing:
                                    HStack{
                                        NavigationLink(destination: LastPage()){
                                            Text("Done")
                                        }
                                    }
            )
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
    
    func saveJoke(){ // Save joke to somewhere I guess
        //        There are two processes to make this work
        //        First load the joke and add joke to the joke list and then save it

        //Important global variables
        let defaults = UserDefaults.standard
        var savedJoke = savedJokes(jokes: [Joke]()) // Empty list

        //Step one: Load the jokes
        
        if let savedPerson = defaults.object(forKey: "SavedJokes") as? Data {
            let decoder = JSONDecoder()
            
            if let loadedJokes = try? decoder.decode(savedJokes.self, from: savedPerson){ //
                savedJoke = loadedJokes
            } else{
                savedJoke = savedJokes(jokes: [Joke]())// Nothing inside
            }

            print(savedJoke) // Showing a list of jokes
        }
        savedJoke.jokes.append(Joke(id: joke.id, type: joke.type, setup: joke.setup, punchline: joke.punchline)) // Pushing the joke into the list
        print(savedJoke)

        //        // Saving it to user defaults
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(savedJoke) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedJokes")
            saved = false
        }
    }
    
}

struct JokePage_Previews: PreviewProvider {
    static var previews: some View {
        JokePage()
    }
}
