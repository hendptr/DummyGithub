//
//  ContentView.swift
//  AppCoda#1
//
//  Created by Hendriawan Putra on 10/11/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let dict = ["😃😄😆😋": "Fast and Furious", "😎🤓🧐☹️😔": "Life of Man"]
    var body: some View {
        
        VStack {
            Text("Guess These Movie")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Can you guess these movie base from these emoji ? Tap The button tu show")
                .font(.title2)
                
            ForEach(dict.sorted(by: >), id: \.key) { key, value in
                Button {
                    textToSpeech(text: value)
                } label: {
                    Text(key)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func textToSpeech(text:String){
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    let sytensizer = AVSpeechSynthesizer()
    sytensizer.speak(utterance)
}
