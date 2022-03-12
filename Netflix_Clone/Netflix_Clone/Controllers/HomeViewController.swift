//
//  HomeViewController.swift
//  Netflix_Clone
//
//  Created by Kevin Topollaj on 12.3.22.
//

import UIKit

class HomeViewController: UIViewController {
  
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
    
    let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    homeFeedTableView.tableHeaderView = headerView
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    homeFeedTableView.frame = view.bounds
  }
  
}

extension HomeViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 20
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
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
}
