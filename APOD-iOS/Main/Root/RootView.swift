//
//  RootView.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var repository: ApodRepository
    
    var body: some View {
        ApodListCoordinator().start(repository: repository)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
