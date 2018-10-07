//
//  ViewController.swift
//  Image2
//
//  Created by Matt Deuschle on 10/6/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    private var imageView = UIImageView()

    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }

    private var image: UIImage? {
        get {
            return imageView.image
        } set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if imageView.image == nil {
            fetchImage()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = SampleURL.golfURL
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    private func fetchImage() {
        if imageView.image == nil {
            if let url = imageURL {
                if let data = try? Data(contentsOf: url) {
                    image = UIImage(data: data)
                }
            }
        }
    }
}

