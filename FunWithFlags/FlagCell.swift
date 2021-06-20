//
//  FlagCell.swift
//  FunWithFlags
//
//  Created by Igor Chernyshov on 20.06.2021.
//

import UIKit

final class FlagCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet var flagImageView: UIImageView!

	// MARK: - Lifecycle
	override func awakeFromNib() {
        super.awakeFromNib()
		flagImageView.layer.borderWidth = 1
		flagImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
