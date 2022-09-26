//
//  ContentView.swift
//  OnBoardIngUI
//
//  Created by Gurjinder Singh on 22/05/22.
//

import SwiftUI

struct ContentView: View {
    //User defaults
    @AppStorage("onboarding") var isShowOnBoard: Bool = true
    var body: some View {
            if isShowOnBoard {
                OnBoardView()
            } else {
                HomeView()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
