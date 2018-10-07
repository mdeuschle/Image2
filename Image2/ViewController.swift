//
//  ViewController.swift
//  Image2
//
//  Created by Matt Deuschle on 10/6/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!

    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
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

    private func fetchImage() {
        if imageView.image == nil {
            if let url = imageURL {
                if let data = try? Data(contentsOf: url) {
                    imageView.image = UIImage(data: data)
                }
            }
        }
    }
}

