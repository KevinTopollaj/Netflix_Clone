//
//  CollectionViewTableViewCell.swift
//  Netflix_Clone
//
//  Created by Kevin Topollaj on 12.3.22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
  
  static let identifier = "CollectionViewTableViewCell"
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.backgroundColor = .systemOrange
  }
  
  required init?(coder: NSCoder) {
    fatalError("Failed to initialize CollectionViewTableViewCell")
  }
  
}
