//
//  CircleGroupView.swift
//  OnBoardIngUI
//
//  Created by Gurjinder Singh on 27/09/22.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    var body: some View {
        ZStack{
            Circle().stroke(shapeColor.opacity(shapeOpacity),lineWidth: 40)
                .frame(width: 240, height: 240, alignment: .center)
            Circle().stroke(shapeColor.opacity(shapeOpacity),lineWidth: 80)
                .frame(width: 240, height: 240, alignment: .center)
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
