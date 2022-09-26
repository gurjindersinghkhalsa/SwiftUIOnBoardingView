//
//  HomeView.swift
//  OnBoardIngUI
//
//  Created by Gurjinder Singh on 22/05/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isShowOnBoard = false
    var body: some View {
        VStack(spacing: 40) {
            Text("Home View").font(.largeTitle)
            Button(action: {
                isShowOnBoard = true
            }) {
                Text("Go to OnBoard")
            }
        }.background(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
