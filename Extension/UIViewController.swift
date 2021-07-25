//
//  UIViewController.swift
//  NavbarDynamic
//
//  Created by dada on 2021/7/24.
//

import Foundation
import UIKit
extension UIViewController {
    
    func request(urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
}
