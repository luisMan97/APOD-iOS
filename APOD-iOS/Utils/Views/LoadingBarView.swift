//
//  LoadingBarView.swift
//  APOD-iOS
//
//  Created by CO-JRIVERA on 30/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import SwiftUI

struct LoadingBarView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Loading...")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -30)
            
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemGray4), lineWidth: 5)
                .frame(width: 300, height: 4)
            
            RoundedRectangle(cornerRadius: 4 )
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 50, height: 4)
                .offset(x: isLoading ? 125 : -125, y: 0)
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }.padding(.top)
    }
}

struct LoadingBarView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBarView()
    }
}
