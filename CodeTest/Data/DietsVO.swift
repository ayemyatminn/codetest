//
//  DietsVO.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation

struct DietsVO: Codable {
    let id: Int
    let name: String
    let tool_tip: String
}

struct DietsData: Codable {
    let data: [DietsVO]
}
