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
    @State private var isAnimating: Bool = false
    
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)

                //MARK - center
                ZStack{
                     //:Zstack

                    CircleGroupView.init(shapeColor: .white, shapeOpacity: 0.2)
                    //parallax effect use below 3 props
                        .offset(x: imageOffset.width * -1) // will move rings in opposite direction
                        .blur(radius: abs(imageOffset.width/5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width/20))) //Rotation effect
                        .gesture(
                            DragGesture() //Drag gesture
                                .onChanged({ gesture in
                                    if abs(imageOffset.width) <= 150 { // stop img to move outside view
                                        imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)){
                                            indicatorOpacity = 0
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)){
                                        indicatorOpacity = 1
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)

                } //: Center
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    ,alignment: .bottom
                )
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
//                            .fill(.green)
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
                                    withAnimation(Animation.easeOut(duration: 0.5)) {
                                        if buttonOffSet > buttonWidth/2 {
                                            buttonOffSet = buttonWidth - 80
                                            isShowOnBoard = false
                                        } else {
                                            buttonOffSet = 0
                                        }
                                    }
                                })
                        )
                        Spacer()
                    }
                }// footer
                .frame(width: buttonWidth,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)

            } // Vstack
        } // Zstack
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
