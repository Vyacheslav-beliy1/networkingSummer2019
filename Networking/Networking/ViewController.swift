//
//  ViewController.swift
//  Networking
//
//  Created by Viacheslav Bilyi on 7/22/19.
//  Copyright © 2019 Viacheslav Bilyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!

	var networkManager = NetworkManager()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	@IBAction func downloadPostsDidTap() {
		networkManager.getAllPosts { [weak self] (posts) in
			DispatchQueue.main.async {
				self?.titleLabel.text = "Posts has been downloaded!"
			}
		}
	}
}

