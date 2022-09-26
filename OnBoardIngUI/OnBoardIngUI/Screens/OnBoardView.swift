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
//                    1. Background Static
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
//                    2. Call to Action (static)
                        Text("Get Started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
//                    3. Capuse dynamic
                    HStack {
                        Capsule()
                            .fill(.red)
                            .frame(width: 80)
                        Spacer()
                    }
//                    4. Circle
                    HStack {
                        ZStack() {
                            Circle()
                                .fill(.red)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            isShowOnBoard = false
                        }
                        Spacer()
                    }
                }// footer
                .frame(height: 80, alignment: .center)
                .padding()
                
            } // Vstack
        } // Zstack
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
