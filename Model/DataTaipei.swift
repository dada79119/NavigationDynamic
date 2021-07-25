//
//  DataTaipei.swift
//  navbar-toggler
//
//  Created by dada on 2021/7/23.
//

import Foundation
import UIKit
// response 參數 decode用
struct DataTaipeiModel: Decodable {
    var result: DataTaipeiResultModel
    private enum DataTaipeiModel: String, CodingKey {
        case result
    }
}
struct DataTaipeiResultModel: Decodable {
    var limit: Int
    var offset: Int
    var count: Int
    var sort: String
    var results:[DataTaipeiResultsModel]
    private enum DataTaipeiResultModel: String, CodingKey {
        case limit
        case offset
        case count
        case sort
        case results
    }
}
struct DataTaipeiResultsModel: Decodable {
    var F_Name_Ch: String
    var F_Location: String
    var F_Feature: String
    var F_Pic01_URL: String
    private enum DataTaipeiResultsModel: String, CodingKey {
        case F_Name_Ch
        case F_Location
        case F_Feature
        case F_Pic01_URL
    }
}
