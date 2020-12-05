//
//  RandomEmoji.swift
//  JokeEmojiApp
//
//  Created by Chun Choi on 2020-12-05.
//

import SwiftUI

extension String{ // Getting random Emoji in swift code from https://gist.github.com/iandundas/59303ab6fd443b5eec39
    static func randomEmoji()->String{
        let range = [UInt32](0x1F601...0x1F64F)
        let ascii = range[Int(drand48() * (Double(range.count)))]
        let emoji = UnicodeScalar(ascii)?.description
        return emoji!
    }
}
struct RandomEmoji: View {
    @State private var emoji = String.randomEmoji()
    var body: some View {
        VStack{
            Text(emoji)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                
            
            Button("Another Emoji"){
                self.emoji = String.randomEmoji()
            }
            .navigationBarTitle("Random Emoji")
        }
    }
}

struct RandomEmoji_Previews: PreviewProvider {
    static var previews: some View {
        RandomEmoji()
    }
}
