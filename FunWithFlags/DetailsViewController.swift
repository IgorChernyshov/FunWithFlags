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
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.lightGray.cgColor
		imageView.image = UIImage(named: imagePath)
	}
}
