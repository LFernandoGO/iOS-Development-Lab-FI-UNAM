//
//  FirstView.swift
//  Bubble Planner
//
//  Created by Luis Fernando Gutierrez on 31/03/23.
//

import SwiftUI

struct FirstView: View {
    @State var welcomeSheetVisible = true
    @State public var selectedTab: Int = 0
    public var body: some View{
        Button(action: {}) {}
            .frame(height: 0)
            .sheet(isPresented: $welcomeSheetVisible) {
            VStack{
                VStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "hand.wave")
                        .font(.system(size: 150))
                        .foregroundColor(.accentColor)
                        .padding(30)
                    Text("Hello!")
                        .font(.system(size: 40))
                        .bold()
                        .padding(30)
                    (
                    Text("This app models presidential elections & allows you to compare results in function of the voting system. The big board in the middle is the ") + Text("political compass").bold() + Text(": the 2 dimensions could mean \"Left v. Right\" & \"Authoritarian v. Liberal\", for instance. Small dots are voters, big squares are candidates; you can drag them, or press & hold for more information. Buttons in the bottom right allow you to reset the plane or learn more about a voting system.")
                    )
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { welcomeSheetVisible.toggle() }) {
                        Text("Enjoy")
                            .font(.title)
                        }
                        .padding(10)
                        .hoverEffect(.highlight)
                    }
                }
                .padding(50)
            }
        }
        TabView(){
            RoutineView()
                .tabItem {
                    Label("Routine", systemImage: "person")
                }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
