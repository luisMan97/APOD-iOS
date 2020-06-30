//
//  ApodRow.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 29/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import SwiftUI

struct ApodRow: View {
    
    var viewModel: ApodViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.title)
                .font(.system(.body, design: .rounded))
            
            Spacer()
            
            Text(viewModel.date)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.gray)
        }
    }
}

/*struct ApodRow_Previews: PreviewProvider {
    static var previews: some View {
        ApodListCoordinator().showApodRow(apod: apod)
    }
}*/

