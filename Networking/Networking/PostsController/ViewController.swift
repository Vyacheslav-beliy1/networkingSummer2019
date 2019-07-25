//
//  ViewController.swift
//  Networking
//
//  Created by Viacheslav Bilyi on 7/22/19.
//  Copyright © 2019 Viacheslav Bilyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView! {
		didSet {
			tableView.delegate = self
			tableView.dataSource = self

			let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
			tableView.register(nib, forCellReuseIdentifier: "PostCellID")
		}
	}

	var posts: [Post] = [] {
		didSet {
			tableView.reloadData()
		}
	}
	var networkManager = NetworkManager()

	override func viewDidLoad() {
		super.viewDidLoad()

		networkManager.getAllPosts { [weak self] (posts) in
			DispatchQueue.main.async {
				self?.posts = posts
			}
		}
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posts.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellID", for: indexPath) as! PostTableViewCell
		cell.configure(posts[indexPath.row])
		return cell
	}
}
