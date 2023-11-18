//
//  AllergiesVO.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation

struct AllergiesVO: Codable {
    let id: Int
    let name: String
}

struct AllergiesData: Codable {
    let data: [AllergiesVO]
}


