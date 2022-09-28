//
//  OnBoardView.swift
//  OnBoardIngUI
//
//  Created by Gurjinder Singh on 22/05/22.
//

import SwiftUI

struct OnBoardView: View {
    @AppStorage("onboarding") var isShowOnBoard = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet: CGFloat = 0
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
                     //:Zstack
                    CircleGroupView.init(shapeColor: .white, shapeOpacity: 0.2)
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
                            .fill(Color("Redish"))
                            .frame(width: buttonOffSet + 80)
                        Spacer()
                    }
//                    4. Circle
                    HStack {
                        ZStack() {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
                                    buttonOffSet = gesture.translation.width
                                }
                            })
                                .onEnded({ _ in
                                    if buttonOffSet > buttonWidth/2 {
                                        buttonOffSet = buttonWidth - 80
                                        isShowOnBoard = false
                                    } else {
                                        buttonOffSet = 0
                                    }
                                })
                            
                        )
//                        gesture(
//                            DragGesture()
//                                .onChanged({ gesture in
////                                    if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
////                                        buttonOffSet = gesture.translation.width
////                                    }
//                                })
//                                .onEnded({ _ in
////                                    if buttonOffSet > buttonWidth / 2 {
////                                        buttonOffSet = buttonWidth - 80
////                                        isShowOnBoard = false
////                                    } else {
////                                        buttonOffSet = 0
////                                    }
//                                })
//                        )
                        Spacer()
                    }
                }// footer
                .frame(width: buttonWidth,height: 80, alignment: .center)
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
