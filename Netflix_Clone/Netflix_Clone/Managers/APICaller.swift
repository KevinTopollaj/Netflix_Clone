//
//  APICaller.swift
//  Netflix_Clone
//
//  Created by Kevin Topollaj on 12.3.22.
//

import Foundation

struct Constants {
  static let API_KEY = "4871fb78c671c96d90bd05e51c75d5a9"
  static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
  static let shared = APICaller()
  
  func getTrendingMovies(completion: @escaping (String) -> Void) {
    guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        print(results)
      } catch {
        print(error.localizedDescription)
      }
    }
    
    task.resume()
  }
}
