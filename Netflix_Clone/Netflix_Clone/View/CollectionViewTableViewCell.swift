//
//  CollectionViewTableViewCell.swift
//  Netflix_Clone
//
//  Created by Kevin Topollaj on 12.3.22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
  
  static let identifier = "CollectionViewTableViewCell"
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 140, height: 200)
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    return collectionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.backgroundColor = .systemBackground
    contentView.addSubview(collectionView)
    
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("Failed to initialize CollectionViewTableViewCell")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    collectionView.frame = contentView.bounds
  }
  
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .systemCyan
    return cell
  }
}
