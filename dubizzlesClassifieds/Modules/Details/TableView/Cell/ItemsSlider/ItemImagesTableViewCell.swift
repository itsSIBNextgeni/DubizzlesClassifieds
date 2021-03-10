//
//  ItemImagesTableViewCell.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 08/03/2021.
//

import UIKit

class ItemImagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewForPicturesCount: UIView!
    @IBOutlet weak var collectionViewImage: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var numericCounter: UILabel!
    
    var images = [String?]() {
        didSet {
            guard !images.isEmpty else {
                viewForPicturesCount.isHidden = true
                pageControl.isHidden = true
                return
            }
            collectionViewImage.reloadData()
            viewForPicturesCount.isHidden = false
            pageControl.isHidden = false
            pageControl.numberOfPages = images.count
            updatenNumericCounter(currentPage: pageControl.currentPage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        viewForPicturesCount.roundCorner(withRadis: 18)
        collectionViewImage.delegate = self
        collectionViewImage.dataSource = self
        collectionViewImage.isPagingEnabled = true
        collectionViewImage.showsHorizontalScrollIndicator = false
        collectionViewImage.register(cellType: ItemSliderCollectionViewCell.self)
    }
}

extension ItemImagesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: ItemSliderCollectionViewCell.self, for: indexPath)
        if let imageUrl = images[indexPath.row] {
            ImageManager.shared.setImage(with: imageUrl, imageView: cell.imageSlider)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize(width: 0.0, height: 0.0)
        }
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        return CGSize(width: collectionViewImage.frame.width, height: collectionViewImage.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        updatenNumericCounter(currentPage: page)
        self.pageControl.currentPage = page
    }
    
    func updatenNumericCounter(currentPage: Int) {
        self.numericCounter.text = "\(currentPage + 1) /\(self.images.count)"
    }
}

extension ItemImagesTableViewCell: UICollectionViewDelegate {
}
