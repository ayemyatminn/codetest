//
//  HealthConcernVO.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation

struct HealthConcernVO: Codable {
    let id: Int
    let name: String
    var isSelected: Bool?
}

struct HealthConcernData: Codable {
    let data: [HealthConcernVO]
}


