//
//  CassiniViewController.swift
//  Image2
//
//  Created by Matt Deuschle on 10/6/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = SampleURL.NASA[identifier] {
                if let destinationVC = segue.destination as? ViewController {
                    destinationVC.imageURL = url
                    destinationVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }

}
