//
//  HomeCollectionViewCell.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti onon 8/3/2021.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.image = UIImage(named: "placeholder-image")
    }
    
    override func prepareForReuse() {
        thumbnailImageView.image = nil
        thumbnailImageView.image = UIImage(named: "placeholder-image")
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        thumbnailImageView.roundCorners(corners: [.topLeft, .topRight], radius: 8.0)
    }
}
extension HomeCollectionViewCell {
    func setUpCell(data: Product?)  {
        guard let viewModel = data else { return }
        priceLabel.text = viewModel.price
        titleLabel.text = viewModel.name?.capitalized
        ImageManager.shared.setImage(with: viewModel.imageUrlsThumbnails?.first ?? "",
                                     imageView: self.thumbnailImageView)
        layoutIfNeeded()
    }
}
