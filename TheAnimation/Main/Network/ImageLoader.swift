//
//  ImageLoader.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 09/04/21.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        let imageModel = ImageModel(urlString: url.absoluteString)
        if let image = imageModel.cacheImage.get(forKey: url.absoluteString) {
            self.image = image
        } else {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in
                    guard let self = self else { return }
                    self.image = $0
                    imageModel.cacheImage.set(forKey: self.url.absoluteString, image: $0 ?? UIImage())
                }
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let url: URL
    private lazy var imageModel = ImageModel(urlString: url.absoluteString)
    
    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        self.url = url
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                placeholder
            }
        }
    }
}
