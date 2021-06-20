//
//  ViewController.swift
//  FunWithFlags
//
//  Created by Igor Chernyshov on 20.06.2021.
//

import UIKit

final class ViewController: UITableViewController {

	private var flagsPaths: [String] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		loadFlagsPaths()
	}

	private func loadFlagsPaths() {
		let fileManager = FileManager.default
		guard let path = Bundle.main.resourcePath,
			  let files = try? fileManager.contentsOfDirectory(atPath: path) else { return }

		for filePath in files {
			if filePath.hasSuffix("@3x.png") {
				flagsPaths.append(filePath)
			}
		}
	}
}

// MARK: - UITableViewDataSource
extension ViewController {

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		flagsPaths.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell") as? FlagCell
			else { return UITableViewCell() }
		let flagImage = UIImage(named: flagsPaths[indexPath.row])
		cell.flagImageView.image = flagImage
		return cell
	}
}

// MARK: - UITableViewDelegate
extension ViewController {

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let viewController = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else { return }
		viewController.imagePath = flagsPaths[indexPath.row]
		navigationController?.pushViewController(viewController, animated: true)
	}
}
