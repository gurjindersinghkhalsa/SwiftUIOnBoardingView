//
//  OnBoardView.swift
//  OnBoardIngUI
//
//  Created by Gurjinder Singh on 22/05/22.
//

import SwiftUI

struct OnBoardView: View {
    @AppStorage("onboarding") var isShowOnBoard = true
    var body: some View {
        VStack(spacing: 40) {
            Text("OnBoard View").font(.largeTitle)
            Button(action:{
                isShowOnBoard = false
            }) {
                Text("Go To Home")
            }
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
