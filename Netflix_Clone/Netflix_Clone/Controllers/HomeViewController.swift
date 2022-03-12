//
//  HomeViewController.swift
//  Netflix_Clone
//
//  Created by Kevin Topollaj on 12.3.22.
//

import UIKit

class HomeViewController: UIViewController {
  
  let sectionTitles = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top Rated"]
  
  private let homeFeedTableView: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    view.addSubview(homeFeedTableView)
    
    homeFeedTableView.dataSource = self
    homeFeedTableView.delegate = self
    
    configureNavBar()
    
    let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    homeFeedTableView.tableHeaderView = headerView
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    homeFeedTableView.frame = view.bounds
  }
  
  private func configureNavBar() {
    var image = UIImage(named: "netflix_logo")
    image = image?.withRenderingMode(.alwaysOriginal)
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
    
    navigationItem.rightBarButtonItems = [
      UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
      UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
    ]
    
    navigationController?.navigationBar.tintColor = .label
  }
  
}

extension HomeViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionTitles.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionTitles[section]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
    cell.textLabel?.text = "Hellooo!"
    return cell
  }
}

extension HomeViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else { return }
    header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    header.textLabel?.textColor = .label
    header.textLabel?.text = header.textLabel?.text?.capitalized
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let defaultOffset = view.safeAreaInsets.top
    let offset = scrollView.contentOffset.y + defaultOffset
    
    navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
  }
}
