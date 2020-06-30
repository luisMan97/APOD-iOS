//
//  ApodDetailView.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import SwiftUI

struct ApodDetailView: View {
     
    @ObservedObject var viewModel: ApodDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack() {
                AsyncImage(
                    url: viewModel.imageURL,
                    placeholder: LoadingBarView().padding(.top)
                ).aspectRatio(contentMode: .fit)
                    .animation(.default)
                
                Text(viewModel.title)
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text(viewModel.date)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding()
                
                Text(viewModel.explanation)
                    .font(.system(.body, design: .rounded))
                    .padding(.horizontal)
                  
                Spacer()
            }
        }.navigationBarTitle(Text(viewModel.title), displayMode: .inline)
    }
}

/*struct ApodDetilView_Previews: PreviewProvider {
    static var previews: some View {
        ApodDetailCoordinator().start(apod: <#Apod#>)
    }
}*/
