//
//  ImageLoader.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera LadinoJorge Luis Rivera Ladino on 30/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    private var cancellable: AnyCancellable?
    private let url: URL?
    
    // Output
    @Published var image: UIImage?

    init(url: URL?) {
        self.url = url
    }
    
    deinit {
        cancel()
    }

    func load() {
        guard let url = url else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
}

