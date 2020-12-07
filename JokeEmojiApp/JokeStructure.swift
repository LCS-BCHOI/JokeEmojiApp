//
//  JokeStructure.swift
//  JokeEmojiApp
//
//  Created by Chun Choi on 2020-12-05.
//

struct Joke : Codable{
    // Api endpiont at https://official-joke-api.appspot.com/random_joke
    var id:Int
    var type:String
    var setup:String
    var punchline:String
}

struct savedJokes: Codable{
    var jokes:[Joke] // A list of saved jokes
}
