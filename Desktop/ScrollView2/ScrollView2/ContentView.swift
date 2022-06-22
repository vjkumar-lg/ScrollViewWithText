//
//  ContentView.swift
//  ScrollView2
//
//  Created by vijay-pt5416 on 17/06/22.
//

import SwiftUI
//$ 2 WAY BINDING





struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var acceptButton: AcceptButton
    @State var declineButton: DeclineButton
    var body: some View {
        ZStack{
            VStack{
                ScrollTextView(text1: $networkManager.paragraph, text2: $networkManager.text2)
                StaticView(declineButton: $declineButton, acceptButton: $acceptButton)
            }
            if networkManager.loading {
                Progress()
            }
        }
        .onAppear {
            self.networkManager.fetchDetails()
        }
    }
}


struct Progress: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            ProgressView()
                .scaleEffect(3)
        }
    }
}

struct ScrollTextView: View {
    @Binding var text1: [String]
    @Binding var text2: String
    var body: some View {
        ScrollView {
            Text(text1.joined(separator: " "))
                .foregroundColor(.orange)
            Text(text2)
                .foregroundColor(.green)
            
        }.padding(.init(top: 1, leading: 10, bottom: 10, trailing: 10))
    }
}

struct DeclineButtonView: View {
    @Binding var declineButton: DeclineButton
    var body: some View {
        Button {
            print("Decline")
        } label: {
            Text(declineButton.title)
                .padding()
        }
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct StaticView: View {
    @Binding var declineButton: DeclineButton
    @Binding var acceptButton: AcceptButton
    var body: some View {
        HStack {
            Spacer()
            AcceptButtonView(acceptButton: $acceptButton)
            Spacer()
            DeclineButtonView(declineButton: $declineButton)
            Spacer()
        }.padding(.bottom)
    }
}

struct AcceptButtonView: View {
    @Binding var acceptButton: AcceptButton
    var body: some View {
        Button {
            print("Accept")
        } label: {
            Text(acceptButton.title)
                .padding()
        }
        .background(.green)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(acceptButton: AcceptButton(), declineButton: DeclineButton())
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
