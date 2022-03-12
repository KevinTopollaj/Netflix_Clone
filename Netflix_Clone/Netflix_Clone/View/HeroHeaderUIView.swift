//
//  HeroHeaderUIView.swift
//  Netflix_Clone
//
//  Created by Kevin Topollaj on 12.3.22.
//

import UIKit

class HeroHeaderUIView: UIView {
  
  private let heroImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = UIImage(named: "heroImage")
    return imageView
  }()
  
  private let playButton: UIButton = {
    let button = UIButton()
    button.setTitle("Play", for: .normal)
    button.layer.borderColor = UIColor.label.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 5
    return button
  }()
  
  private let downloadButton: UIButton = {
    let button = UIButton()
    button.setTitle("Download", for: .normal)
    button.layer.borderColor = UIColor.label.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 5
    return button
  }()
  
  private func addGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [
      UIColor.clear.cgColor,
      UIColor.systemBackground.cgColor
    ]
    gradientLayer.frame = bounds
    layer.addSublayer(gradientLayer)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(heroImageView)
    addGradient()
    addSubview(playButton)
    addSubview(downloadButton)
    
    applyConstraints()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    heroImageView.frame = bounds
  }
  
  private func applyConstraints() {
    
    let playButtonConstraints = [
      playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
      playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
      playButton.widthAnchor.constraint(equalToConstant: 110)
    ]
    
    let downloadButtonConstraints = [
      downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
      downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
      downloadButton.widthAnchor.constraint(equalToConstant: 110)
    ]
    
    NSLayoutConstraint.activate(playButtonConstraints)
    NSLayoutConstraint.activate(downloadButtonConstraints)
  }
  
}
