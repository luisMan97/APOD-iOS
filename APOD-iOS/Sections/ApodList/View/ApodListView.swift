//
//  ApodListView.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 26/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import SwiftUI

struct ApodListView: View {
    
    @ObservedObject var viewModel: ApodListViewModel
    
    init(viewModel: ApodListViewModel) {
        self.viewModel = viewModel
        UINavigationBar().setup()
    }
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: $viewModel.showProgress) {
                List(self.viewModel.apodList) { apod in
                   NavigationLink(destination: ApodListCoordinator().presentApodDetailView(with: apod)) {
                       ApodListCoordinator().showApodRow(apod: apod)
                   }
                }
            }
            .navigationBarTitle("Astronomy Picture of the Day")
        }
        .alert(item: $viewModel.responseError) {
            Alert(
                title: Text("Error"),
                message: Text($0.message),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ApodListCoordinator().start()
    }
}
