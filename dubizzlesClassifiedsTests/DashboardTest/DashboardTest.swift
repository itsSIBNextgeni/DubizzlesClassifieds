//
//  DashboardTest.swift
//  DubizzlesClassifiedsTests
//
//  Created by Shahzaib Iqbal Bhatti on 3/10/21.
//

import XCTest
@testable import DubizzlesClassifieds

class DashboardTest: XCTestCase {
    
    func test_viewDidLoad_populateEmptyCollection() {
        XCTAssertEqual(makeSUT().collectionView.numberOfItems(inSection: 0), 0)
    }
    func test_DidFireAPI_CoutIsGreaterThenZero() {
        let sut = makeSUT()
        sut.presenter?.makeMockNetowrkCall()
        XCTAssertEqual(sut.presenter?.dataProducts?.count, 20)
    }
    func test_cellAtZeroHaveNameNotebook() {
        let sut = makeSUT()
        sut.presenter?.makeMockNetowrkCall()
        XCTAssertEqual(sut.collectionView.title(at: 0) ?? "", "Notebook")
        XCTAssertEqual(sut.collectionView.price(at: 0) ?? "", "AED 5")
    }
    func test_cellAtIndexesTextCount() {
        let sut = makeSUT()
        sut.presenter?.makeMockNetowrkCall()
        XCTAssertGreaterThan(sut.collectionView.title(at: 0)?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.collectionView.title(at: 1)?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.collectionView.title(at: 5)?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.collectionView.title(at: 19)?.count ?? 0, 0)
    }
    
    func test_cellAtIndexesPriceCount() {
        let sut = makeSUT()
        sut.presenter?.makeMockNetowrkCall()
        XCTAssertGreaterThan(sut.collectionView.price(at: 0)?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.collectionView.price(at: 3)?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.collectionView.price(at: 9)?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.collectionView.price(at: 18)?.count ?? 0, 0)
    }
    func test_cellAtIndexesHaveImageUrl() {
        let sut = makeSUT()
        sut.presenter?.makeMockNetowrkCall()
        XCTAssertGreaterThan(sut.presenter?.getProducts(at: 0)?.imageUrls?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.presenter?.getProducts(at: 4)?.imageUrls?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.presenter?.getProducts(at: 8)?.imageUrls?.count ?? 0, 0)
        XCTAssertGreaterThan(sut.presenter?.getProducts(at: 16)?.imageUrls?.count ?? 0, 0)
    }
    
    override class func setUp() {
    }
    override class func tearDown() {
    }
    
    // MARK: Helper
    
    func makeSUT() -> DashboardViewController {
        let sut = DashboardRouter.createModule() as? DashboardViewController
        _ = sut?.view
        return sut ?? DashboardViewController()
    }
}
private extension UICollectionView {
    func cell(at row: Int) -> UICollectionViewCell? {
        return dataSource?.collectionView(self, cellForItemAt: IndexPath(row: row, section: 0))
    }
    func title(at row: Int) -> String? {
        let cellHome = cell(at: row) as? HomeCollectionViewCell
        return cellHome?.titleLabel.text
    }
    func price(at row: Int) -> String? {
        let cellHome = cell(at: row) as? HomeCollectionViewCell
        return cellHome?.priceLabel.text
    }
}
