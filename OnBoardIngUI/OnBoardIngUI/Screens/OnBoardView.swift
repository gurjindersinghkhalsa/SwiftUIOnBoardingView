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
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all) // View
            VStack(spacing: 20) {
                //MARK - Header
                
                Spacer()
                VStack(spacing: 0) {
                    Text("Share")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
//                    .background(.red)
                }
                
                //MARK - center
                ZStack{
                    ZStack{
                        Circle().stroke(.white.opacity(0.4),lineWidth: 40)
                            .frame(width: 240, height: 240, alignment: .center)
                        Circle().stroke(.white.opacity(0.2),lineWidth: 80)
                            .frame(width: 240, height: 240, alignment: .center)
                    } //:Zstack
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: Center
                
                Spacer()
                
                //MARK - Footer
                
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                }
                .frame(height: 80, alignment: .center)
                .padding()
                // footer
            } // Vstack
        } // Zstack
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
