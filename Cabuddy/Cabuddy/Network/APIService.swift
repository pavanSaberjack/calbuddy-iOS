//
//  APIService.swift
//  Cabuddy
//
//  Created by YML1 on 30/04/23.
//

import Foundation

typealias APIServiceCompletion = (Result<Bool, Error>) -> Void

protocol APIService {
    
    var baseURL: URL { get }
}
