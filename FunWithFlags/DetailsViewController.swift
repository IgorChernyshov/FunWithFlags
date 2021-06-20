//
//  DetailsViewController.swift
//  FunWithFlags
//
//  Created by Igor Chernyshov on 20.06.2021.
//

import UIKit

final class DetailsViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet var imageView: UIImageView!

	// MARK: - Properties
	var imagePath: String?

	// MARK: - Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
		guard let imagePath = imagePath else {
			dismiss(animated: true)
			return
		}

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShareButton))

		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.lightGray.cgColor
		imageView.image = UIImage(named: imagePath)
	}

	// MARK: - Selectors
	@objc private func didTapShareButton() {
		guard let image = imageView.image,
			  let flagName = imagePath?.split(separator: "@").first else { return }
		let activityViewController = UIActivityViewController(activityItems: [image, flagName], applicationActivities: nil)
		activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(activityViewController, animated: true)
	}
}
