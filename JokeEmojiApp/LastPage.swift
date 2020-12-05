//
//  LastPage.swift
//  JokeEmojiApp
//
//  Created by Chun Choi on 2020-12-05.
//

import SwiftUI

struct LastPage: View {
    var body: some View {
        VStack{
            Spacer()
            Text(String.randomEmoji())
                .font(.title)
            
            Spacer()
            Text("Have A Nice Day")
                .font(.title)
                .fontWeight(.ultraLight)
            
            Spacer()
        }
    }
}

struct LastPage_Previews: PreviewProvider {
    static var previews: some View {
        LastPage()
    }
}
