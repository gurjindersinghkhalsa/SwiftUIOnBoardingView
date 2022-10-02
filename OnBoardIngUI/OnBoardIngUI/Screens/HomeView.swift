//
//  HomeView.swift
//  OnBoardIngUI
//
//  Created by Gurjinder Singh on 22/05/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isShowOnBoard = false
    @State private var isAnimating: Bool = false
    var body: some View {
        
        VStack(spacing: 40) {
            // Header
            Spacer()
            ZStack {
                CircleGroupView.init(shapeColor: .secondary, shapeOpacity: 0.9)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -30)
                    .animation(
                        .easeOut(duration: 4)
                        .repeatForever(),
                        value: isAnimating)
                    
            }
            //Center
            Text("The time that leads to mastery is dependent on the intesity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //Footer
            Spacer()
            Button(action: {
                withAnimation {
                    playSound(sound: "Restart", type: "mp3")
                    isShowOnBoard = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title2))
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 4))
            .controlSize(.large)
        }
        .background(Color("ColorBlue"))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                isAnimating = true
            }
            
        }.preferredColorScheme(.dark)
    }
    

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
